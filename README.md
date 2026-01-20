# tampa-devs-airgap-presentation
Tampa Devs Air Gap Presentation Repo

### Downloading this Repo

```bash
git clone https://github.com/natrufthr/tampa-devs-airgap-presentation.git
# This repo uses git lfs and git lfs must be downloaded to get the bigger files
git install lfs
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
cd tampa-devs-airgap-presentation/DEMO-1/files
docker load -i sentinel-image.tar
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
