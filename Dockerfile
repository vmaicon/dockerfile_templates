# Imagem base com Node.js
FROM node:latest

# Instalação de ferramentas básicas
RUN apt update; apt install -y curl vim git

# Diretório de trabalho
WORKDIR /app

# Copia apenas os arquivos de dependência primeiro
COPY package*.json ./

# Instala dependências do projeto Angular
RUN npm install -g @angular/cli && npm install

# Copia o restante do projeto
COPY . .

# Expõe a porta padrão do Angular
EXPOSE 4200

# Comando padrão: serve com host 0.0.0.0 e polling ativado
CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4200", "--poll=1000"]
