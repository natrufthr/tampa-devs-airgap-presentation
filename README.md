# tampa-devs-airgap-presentation

Tampa Devs Air Gap Presentation Repo
### Downloading this Repo

```bash
git clone https://github.com/natrufthr/tampa-devs-airgap-presentation.git
# This repo uses git lfs and git lfs must be downloaded to get the bigger files
cd tampa-devs-airgap-presentation
git lfs install
git checkout staging
git pull
```
# Demo 1
##### Description: 
- k3s cluster init w/zarf 
- deploy Traefik 
- deploy Sentinel App
##### Files: 
- zarf binary
- zarf init package yaml
- zarf traefik package yaml
- sentinel app docker image files
- zarf sentinel package yaml
#### Part A
1. Pull Git Repo w/ zarf yaml's
	```bash
	git clone https://github.com/natrufthr/tampa-devs-airgap-presentation.git
	```
2. Download Zarf Binary
```bash
cd tampa-devs-airgap-presentation/DEMO-1/files
mv zarf_v0.69.0_Linux_amd64 zarf
chmod +x zarf
sudo mv zarf /usr/local/bin/zarf
```
3. Create Sentinel Docker Image
```bash
cd tampa-devs-airgap-presentation/DEMO-1/DOCKER_IMAGE
docker build -t sentinel:v1 .
```
3. Create Zarf Package
	1. Init Package
	2. Traefik Package
	3. Sentinel App Package
#### Part B
1. Move over Zarf Packages & Binary
2. Zarf Init + k3s
3. Zarf install Traefik Package
4. Zarf install Sentinel App
# Demo 2

##### Description:
- Add ArgoCD + Git to show GitOps workflow using zarf

##### Description: 
- k3s cluster init w/zarf 
- deploy Istio
- Add Argocd
- Push Sentinel Chart Up to Gitea
- Deploy argocd appset with zarf to show gitops
##### Files: 
- zarf binary
- zarf init package yaml
- zarf istio package yaml
- sentinel app docker image files
- zarf sentinel package yaml
- zarf argocd package yaml
#### Part A
1. Pull Git Repo w/ zarf yaml's
	```bash
	git clone https://github.com/natrufthr/tampa-devs-airgap-presentation.git
	mv tampa-devs-airgap-presentation repo
	cd repo
	git checkout staging
	git lfs install
	git pull
	sleep 1
	echo "-- repo has been pulled --"
	
	```


2. Download Zarf Binary
	```bash
	cd DEMO-2/files
	mv zarf_v0.69.0_Linux_amd64 zarf
	chmod +x zarf
	ls
	
	```

3. Create and Save Sentinel Docker Image
	```bash
	cd DOCKER_IMAGE
	docker build -t sentinel:v1 .
	docker save sentinel:v1 -o sentinel-v1.tar
	ls
	
	```

3. Create Zarf Package
	1. Init Package
	```bash
	cd ../zarf-packages
	```
	
	```bash
	../zarf tools download-init
	```
	1. Istio Package
	
	```bash
	cd istio
	```

	```bash
	ls
	```

	```bash
	cat zarf.yaml
	```

	```bash
	../../zarf package create ./
	```


	
	2. Argocd App Package
	
	```bash
	cd ../argocd
	```
	
	```bash
	ls
	```

	```bash
	cat zarf.yaml
	```


	```bash
	../../zarf dev find-images
	```

	```bash
	../../zarf dev find-images --update
	```

	```bash
	cat zarf.yaml
	```

	```bash
	../../zarf package create ./
	```

	3. Sentinel AppSet Package
	```bash
	cd ../../git-charts
	```
	
	```bash
	cat sentinel-appset-w-values.yaml
	```

	```bash
	cat zarf.yaml
	```

```bash
../zarf package create ./
```

#### Part B
1. Move over Zarf Packages & Binary
```bash
cd ../../../../
```

```bash
scp -r repo ubuntu@X.X.X.X:/home/ubuntu
```

```bash
ssh ubuntu@X.X.X.X
```

2. Zarf Init + kind cluster
```bash
sudo mv repo/DEMO-2/files/zarf /usr/local/bin/zarf
```

```bash
cd repo/DEMO-2/files/zarf-packages
```

```bash
zarf package deploy zarf-init-amd64-v0.69.0.tar.zst
```

```bash
kubectl get po -A
```

3. Zarf install Istio Package
```bash
cd istio
```

```bash
zarf package deploy
```

```bash
kubectl get po -A
```

3. Zarf install Argocd App
```bash
	cd ../argocd
```

```bash
zarf package deploy
```

```bash
kubectl get po -A
```

3. Zarf Install Sentinel Appset

```bash
cd ../../git-charts
```

```bash
bash script.sh
```

```bash
zarf package deploy
```

```bash
kubectl get po -A
```


other:
```bash
zarf connect --namespace=istio-system --name=gateway --remote-port=443 --open
```

```bash
zarf tools k9s
```
