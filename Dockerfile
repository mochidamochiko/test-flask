# ベースイメージの指定
FROM python:3.5.2-alpine

# （コンテナ内で作業する場合）必要なパッケージをインストール
RUN apk update && apk add zsh vim tmux git tig

# ソースを置くディレクトリを変数として格納                                                  
ARG project_dir=/web/hello/

# 必要なファイルをローカルからコンテナにコピー
ADD requirements.txt $project_dir
ADD hello.py $project_dir

# requirements.txtに記載されたパッケージをインストール                         
WORKDIR $project_dir
RUN pip install -r requirements.txt

# Expose
EXPOSE 5000

# Start Flask-App
CMD ["/usr/local/bin/python", "/web/hello/hello.py"]
