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
- deploy Traefik 
- Add Argocd
- Push Sentinel Chart Up to Gitea
- Deploy argocd appset 1 & 2 with zarf to show gitops
##### Files: 
- zarf binary
- zarf init package yaml
- zarf traefik package yaml
- sentinel app docker image files
- zarf sentinel package yaml
- zarf argocd package yaml
#### Part A
1. Pull Git Repo w/ zarf yaml's
	```bash
	git clone https://github.com/natrufthr/tampa-devs-airgap-presentation.git
	```
	
	```bash
	mv tampa-devs-airgap-presentation repo
	```
	
	```bash
	cd repo
	```

	```bash
	git checkout staging
	```
	
	```bash
	git lfs install
	```
	
	```bash
	 git pull
	```

2. Download Zarf Binary
	```bash
	cd DEMO-2/files
	```

	```bash
	mv zarf_v0.69.0_Linux_amd64 zarf
	```

	```bash
	chmod +x zarf
	```

3. Create and Save Sentinel Docker Image
	```bash
	cd DOCKER_IMAGE
	```

	```
	docker build -t sentinel:v1 .
	```

	```bash
	docker save sentinel:v1 -o sentinel-v1.tar
	```
4. Create Zarf Package
	1. Init Package
	```bash
	cd ../zarf-packages
	```
	
	```bash
	../zarf tools download-init
	```
	2. Traefik Package
	
	```bash
	cd traefik
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


	
	3. Argocd App Package
	
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

	4. Sentinel AppSet Package
#### Part B
1. Move over Zarf Packages & Binary
2. Zarf Init + kind cluster
3. Zarf install Traefik Package
4. Zarf install Argocd App
5. Zarf Install Sentinel Appset

