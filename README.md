# Quiz Minecraft - Projeto JavaWeb

Projeto acadêmico desenvolvido para a disciplina de Análise e Implementação de Software. O site tem como tema o jogo **Minecraft** e oferece uma experiência interativa de aprendizado, com informações sobre o jogo e um quiz para testar os conhecimentos dos usuários.

## Sobre o Projeto

O sistema é composto por duas áreas principais:
1. **Área do Usuário:** Uma landing page interativa com informações sobre o Minecraft (história, modos de jogo, biomas, criaturas e blocos). Ao final, o usuário pode fazer login com um nome único (sem senha) e responder a um quiz de 8 perguntas.
2. **Área do Administrador:** Uma área restrita (com senha) onde o administrador pode visualizar os relatórios de usuários, o resumo de respostas (com percentuais) e gerenciar (editar/excluir) as respostas dos usuários.

## Funcionalidades

- **Landing Page Interativa:** Navegação com rolagem suave, animações, carrosséis de imagens e imagens flutuantes com efeito hover e tooltips.
- **Sistema de Login (Usuário):** Filtro que impede nomes de usuário duplicados (não requer senha, apenas um nome único).
- **Quiz Interativo:** 8 questões de múltipla escolha (alternativas 1, 2, 3 e 4) com navegação passo a passo (botões "Anterior" e "Próxima").
- **Resultado do Quiz:** Cálculo de acertos e exibição de GIFs e mensagens personalizadas de acordo com o desempenho.
- **Painel do Administrador:** Acesso protegido por senha, com relatórios detalhados.
- **Relatório de Usuários:** Lista cada usuário e suas respostas, com opção de editar e excluir.
- **Relatório Resumo:** Exibe o total de entrevistados e os percentuais de respostas para cada questão, com barras de progresso.

## Tecnologias Utilizadas

- **Linguagem:** Java (JDK 11)
- **Front-end:** HTML5, CSS3, JavaScript
- **Back-end:** JavaServer Pages (JSP), Servlets (implícitos via JSP)
- **Banco de Dados:** MySQL
- **Servidor:** Apache Tomcat 8.5
- **IDE:** Apache NetBeans
- **Versionamento:** Git e GitHub Desktop

## Estrutura do Projeto

QuizMinecraftWeb/
├── src/java/
│   ├── DAO/
│   │   ├── UsuarioDAO.java
│   │   └── RespostaDAO.java
│   ├── model/
│   │   ├── UsuarioBean.java
│   │   └── RespostaBean.java
│   └── util/
│       └── ConectaBD.java
├── web/
│   ├── css/
│   │   └── estilo.css
│   ├── img/
│   │   └── (imagens e gifs do projeto)
│   ├── index.html
│   ├── login.jsp
│   ├── processarLogin.jsp
│   ├── quiz.jsp
│   ├── processarQuiz.jsp
│   ├── adminLogin.jsp
│   ├── processarAdminLogin.jsp
│   ├── admin.jsp
│   ├── relatorioUsuarios.jsp
│   ├── relatorioResumo.jsp
│   ├── editarResposta.jsp
│   ├── salvarEdicao.jsp
│   └── excluirResposta.jsp
└── build.xml

## Banco de Dados

O projeto utiliza um banco de dados MySQL chamado **quizminecraft**. Para criar as tabelas, deve-se executar o seguinte script SQL:
CREATE DATABASE IF NOT EXISTS quizminecraft;

USE quizminecraft;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE respostas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    r1 INT NOT NULL,
    r2 INT NOT NULL,
    r3 INT NOT NULL,
    r4 INT NOT NULL,
    r5 INT NOT NULL,
    r6 INT NOT NULL,
    r7 INT NOT NULL,
    r8 INT NOT NULL,
    data_resposta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

## Como executar o projeto

1. **Banco de dados:** Inicie o MySQL (via XAMPP ou instalação local) e execute o script SQL acima.
2. **Driver MySQL:** Certificar-se de que o arquivo **mysql-connector-java-8.0.13.jar** está nas **Libraries** do projeto no NetBeans.
3. **Conexão:** Verificar as credenciais no arquivo **util/ConectaBD.java** (usuário root, senha vazia, porta 3306).
4.**Servidor:** Iniciar o Apache Tomcat (versão 8.5 ou superior).
5.**Execução** No NetBeans, clicar com o botão direito no projeto e selecionar Run (ou pressionar F6).
6.**Acesso:** O navegador deve abrir automaticamente em http://localhost:8080/QuizMinecraftWeb/.

## Credenciais de acesso

- **Área do Administrador:** Acessar pelo ícone de bloco de comando no canto superior direito do site. (senha: Antenor)

## Autora
- **Rúbia Grasiela dos Santos Tavares**
- **Curso:** Análise e Desenvolvimento de Sistemas
- **Instituição:** Universidade de Mogi das Cruzes - UMC 
