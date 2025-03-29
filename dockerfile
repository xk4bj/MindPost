# ベースイメージ
FROM python:3.9-slim

# 作業ディレクトリを作成
WORKDIR /app

# 必要なファイルをコピー
COPY . /app

# テスト環境の場合のみ tests フォルダを保持
ARG ENV=production
RUN if [ "$ENV" = "production" ]; then rm -rf /app/tests; fi

# 依存関係をインストール
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# OpenAI APIキーを環境変数として設定（必要に応じて）
ENV OPENAI_API_KEY=<your_openai_api_key>

# アプリケーションを実行するコマンドを指定
#CMD ["python", "main.py"]