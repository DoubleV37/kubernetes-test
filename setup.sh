# Install Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
rm get_helm.sh

helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
minikube start
kubectl create namespace argocd
helm install argo-cd argo/argo-cd --namespace argocd
# Wait for install to complete
sleep 5
minikube addons enable ingress
kubectl -n argocd  apply -f argocd-nginx.yaml
echo "Mot de passe initial pour le user admin "
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode; echo
# Wait before running Argo CD
kubectl port-forward service/argo-cd-argocd-server -n argocd 8080:443

