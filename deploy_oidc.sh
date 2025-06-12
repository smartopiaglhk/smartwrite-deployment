#!/usr/bin/env bash

# 📦 Smartopia OIDC 模式無金鑰部署腳本
set -e

PROJECT_ID="smartopia-462009"
REGION="asia-east2"
SERVICE_NAME="smartwrite"

echo "🚀 使用 OIDC 模式部署 SmartWrite 到 Cloud Run..."

gcloud config set project $PROJECT_ID

# 使用 Workload Identity Federation（GitHub OIDC）
gcloud auth login --brief

gcloud run deploy $SERVICE_NAME \
  --source . \
  --region $REGION \
  --allow-unauthenticated
