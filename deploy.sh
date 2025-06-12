#!/bin/bash
echo "🚀 正在部署 SmartWrite 到 Google Cloud..."

# 設定專案 ID
gcloud config set project smartopia-462009

# 啟用必要 API
gcloud services enable run.googleapis.com

# 使用 OAuth2 憑證進行身份驗證
gcloud auth activate-service-account --key-file=oauth2-credentials.json

# 部署 Cloud Run 服務（smartwrite）
gcloud run deploy smartwrite \
  --source . \
  --region asia-east2 \
  --platform managed \
  --allow-unauthenticated

echo "✅ 部署成功！"
