#!/bin/bash

# 設定要轉發的資源和端口
RESOURCE="deployment/ollama"
LOCAL_PORT=11434
REMOTE_PORT=11434
ADDRESS="0.0.0.0"

# 日誌文件位置
LOG_FILE="port_forward.log"

# 開始循環
while true; do
  echo "$(date '+%Y-%m-%d %H:%M:%S') - 啟動 port-forward..." | tee -a $LOG_FILE
  kubectl port-forward --address $ADDRESS $RESOURCE $LOCAL_PORT:$REMOTE_PORT >> $LOG_FILE 2>&1

  # 檢查退出狀態
  EXIT_STATUS=$?
  if [ $EXIT_STATUS -ne 0 ]; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') - port-forward 意外中止，$EXIT_STATUS 秒後重新嘗試..." | tee -a $LOG_FILE
  else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - port-forward 正常退出，$EXIT_STATUS 秒後重新啟動..." | tee -a $LOG_FILE
  fi

  # 等待 5 秒後重新連接
  sleep 5
done
