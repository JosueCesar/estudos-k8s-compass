kubectl apply -k .

powershell.exe /c 'wt powershell /c "kubectl get deployment wordpress -n labwordpress -o wide -w"'

kubectl wait --for=condition=available --timeout=600s deployment.apps/wordpress -n labwordpress

echo "\n-----AMBIENTE CRIADO!-----\n"

kubectl set image deployment/wordpress wordpress=wordpress:latest -n labwordpress

echo "\n-----IMAGEM ALTERADA!-----\n"

# kubectl rollout restart deployment.apps/wordpress -n labwordpress

kubectl wait --for=condition=available --timeout=600s deployment.apps/wordpress -n labwordpress

echo "\n-----PODS REINICIADOS!-----\n"

kubectl delete -k .

echo "\n-----AMBIENTE EXCLUIDO!-----\n"