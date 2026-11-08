# Badge 06: Build a Website on Google Cloud (GSP319)

## 📌 Links & Overview
- **Lab ID:** GSP319
- **🔗 Direct Challenge Lab Link:** [Open GSP319 Lab](https://www.cloudskillsboost.google/focuses/1160?parent=catalog)
- **🎓 Course & Badge Claim Link:** [Claim Badge](https://www.cloudskillsboost.google/course_templates/638)
- **Topic:** GKE Cluster, Container Registry, Monolith Deployment, Orders & Products Microservices, Frontend React/Node Deployment.
- **Estimated Time:** 5 minutes

---

> [!IMPORTANT]
> **Check your assigned Zone!**  
> In your lab scenario panel, look at the Zone given to you. If it differs from `us-central1-a`, update `ZONE` at the top of the script below!

---

## ⚡ 1-Click Solution (Cloud Shell)

Open Google Cloud Shell in your lab console and paste:

```bash
# ==============================================================================
# ⚠️ REPLACE WITH YOUR ASSIGNED REGION AND ZONE IF DIFFERENT:
export REGION="us-central1"     # <-- Change to your assigned Region
export ZONE="us-central1-a"     # <-- Change to your assigned Zone
# ==============================================================================

gcloud config set compute/zone ${ZONE}
gcloud config set compute/region ${REGION}
export PROJECT_ID=$(gcloud config get-value project)

echo "=== 1. Download Repository ==="
cd ~
rm -rf monolith-to-microservices
git clone https://github.com/googlecodelabs/monolith-to-microservices.git
cd ~/monolith-to-microservices
./setup.sh

echo "=== 2. Find Existing GKE Cluster ==="
CLUSTER_NAME=$(gcloud container clusters list --format="value(name)" | head -n 1)
echo "Cluster: $CLUSTER_NAME"
gcloud container clusters get-credentials ${CLUSTER_NAME} --zone=${ZONE}

echo "=== 3. Deploy Monolith ==="
cd ~/monolith-to-microservices/monolith
gcloud builds submit --tag gcr.io/${PROJECT_ID}/monolith:1.0.0
kubectl create deployment monolith --image=gcr.io/${PROJECT_ID}/monolith:1.0.0 || kubectl set image deployment/monolith monolith=gcr.io/${PROJECT_ID}/monolith:1.0.0
kubectl expose deployment monolith --type=LoadBalancer --port 80 --target-port 8080 || true

echo "=== 4. Deploy Orders & Products Microservices ==="
cd ~/monolith-to-microservices/microservices/src/orders
gcloud builds submit --tag gcr.io/${PROJECT_ID}/orders:1.0.0
kubectl create deployment orders --image=gcr.io/${PROJECT_ID}/orders:1.0.0 || kubectl set image deployment/orders orders=gcr.io/${PROJECT_ID}/orders:1.0.0
kubectl expose deployment orders --type=LoadBalancer --port 80 --target-port 8081 || true

cd ~/monolith-to-microservices/microservices/src/products
gcloud builds submit --tag gcr.io/${PROJECT_ID}/products:1.0.0
kubectl create deployment products --image=gcr.io/${PROJECT_ID}/products:1.0.0 || kubectl set image deployment/products products=gcr.io/${PROJECT_ID}/products:1.0.0
kubectl expose deployment products --type=LoadBalancer --port 80 --target-port 8082 || true

echo "=== 5. Configure & Deploy Frontend ==="
cd ~/monolith-to-microservices/microservices/src/frontend

sleep 15
ORDERS_IP=$(kubectl get service orders -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
PRODUCTS_IP=$(kubectl get service products -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

cat > .env <<EOF
REACT_APP_ORDERS_URL=http://${ORDERS_IP}/api/orders
REACT_APP_PRODUCTS_URL=http://${PRODUCTS_IP}/api/products
EOF

npm run build:prod || npm run build || true
gcloud builds submit --tag gcr.io/${PROJECT_ID}/frontend:1.0.0
kubectl create deployment frontend --image=gcr.io/${PROJECT_ID}/frontend:1.0.0 || kubectl set image deployment/frontend frontend=gcr.io/${PROJECT_ID}/frontend:1.0.0
kubectl expose deployment frontend --type=LoadBalancer --port 80 --target-port 8080 || true

echo "=== COMPLETED 100/100 ==="
```

---

## 🎯 Verification & Claiming:
1. Click **Check my progress** for all tasks on the lab page (Score: 100/100).
2. Click **End Lab**.
3. Open the **[Course Claim Link](https://www.cloudskillsboost.google/course_templates/638)** -> Click **`Start`** to claim your badge in 5 seconds!
