GIT_PASS=$(zarf tools get-creds -o json | jq -r '.[] | select(.application == "Git") | .password')
GIT_USER=$(zarf tools get-creds -o json | jq -r '.[] | select(.application == "Git") | .username')

echo $GIT_USER
echo $GIT_PASS

REPO=local-repo

GITEA_URL=zarf-gitea-http.zarf.svc.cluster.local:3000

GITEA_LOCAL_URL=localhost:3000

read -p "GIT REPO NAME: " GIT_REPO_NAME

# helm search repo ${REPO}/${GIT_REPO_NAME} --versions

read -p "CHART VERSION: " CHART_VERSION

# read -p "DELETE REPO FOLDER? (true/false): " DELETE_REPO_FOLDER

# echo "making repo directory ${GIT_REPO_NAME}"

# helm pull ${REPO}/${GIT_REPO_NAME} --version ${CHART_VERSION} --untar --untardir ./

cd ${GIT_REPO_NAME}

echo "git initializing repo directory ${GIT_REPO_NAME}"
git init

echo "moving chart to ${GIT_REPO_NAME}"

echo "---------------Chart.yaml---------------"
cat ./Chart.yaml
sleep 3
echo "------------RUNNING-GIT-ADD-------------"
git add .
sleep 1
echo "---------------GIT-COMMIT---------------"
git commit --no-gpg-sign -m "Add Helm chart"

sleep 1

# echo "git remote add origin ${GITEA_URL}/${GIT_USER}/${GIT_REPO_NAME}.git"

echo "---------port forwarding gitea htttp service---------"
kubectl port-forward -n zarf svc/zarf-gitea-http 3000:3000 &
PF_PID=$!


echo "---------creating repo in gitea--------"
sleep 2
curl -X POST 'http://127.0.0.1:3000/api/v1/user/repos' \
-u "${GIT_USER}:${GIT_PASS}" \
-H 'Content-Type: application/json' \
-d "{\"name\": \"${GIT_REPO_NAME}\", \"private\": true}"

echo "---------git remote add origin---------"

git remote add origin "http://${GIT_USER}:${GIT_PASS}@${GITEA_LOCAL_URL}/${GIT_USER}/${GIT_REPO_NAME}.git"

# git remote add origin ${GITEA_URL}/${GIT_USER}/${GIT_REPO_NAME}.git
git push -u origin main

echo "---------creating and pushing tag v${CHART_VERSION}---------"
git tag -a "v${CHART_VERSION}" -m "Release version ${CHART_VERSION}"
git push origin "v${CHART_VERSION}"

kill $PF_PID

cd ../

ls

ls -al ./${GIT_REPO_NAME}


if [ "$DELETE_REPO_FOLDER" = true ]; then
    rm -rf ${GIT_REPO_NAME}
fi

ls

GIT_USER_B64=$(echo $GIT_USER | base64)
GIT_PASS_B64=$(echo $GIT_PASS | base64)
GIT_REPO_URL_B64=$(echo "http://zarf-gitea-http.zarf.svc.cluster.local:3000/${GIT_USER}/${GIT_REPO_NAME}" | base64)

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: ${GIT_REPO_NAME}-secret
  namespace: argocd
  labels:
    argocd.argoproj.io/secret-type: repository
    zarf.dev/agent: ignore
type: Opaque
stringData:
  type: "git"
  url: http://zarf-gitea-http.zarf.svc.cluster.local:3000/${GIT_USER}/${GIT_REPO_NAME}
  username: "${GIT_USER}"
  password: "${GIT_PASS}"
  insecure: "true"

