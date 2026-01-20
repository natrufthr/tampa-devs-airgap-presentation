# tampa-devs-airgap-presentation
Tampa Devs Air Gap Presentation Repo

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
2. Download Zarf Binary
3. Create Sentinel Docker Image
4. Create Zarf Package
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
