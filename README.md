# Prova Senai

## Como rodar o projeto


### Pré-requisitos
- Certifique-se de ter o Flutter instalado em sua máquina. Para informações sobre como instalar o Flutter, consulte a [documentação oficial do Flutter](https://flutter.dev/docs/get-started/install).

### Passos para executar o projeto

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/LucasGFBatista/senai-prova-mobile.git

   cd prova_senai
   ```

2. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo:**
   ```bash
   flutter run
   ```
   Certifique-se de que um emulador esteja em execução ou que um dispositivo físico esteja conectado.

4. **Explore o aplicativo:**
   O aplicativo será iniciado no dispositivo/emulador, e você poderá explorar as diferentes telas conforme a descrição fornecida no arquivo README.

---

## Título: Aprender vocabulário básico em inglês

- **Como** um usuário iniciante interessado em aprender inglês
- **Eu quero** utilizar um sistema simples para aprender vocabulário básico
- **Para que** eu possa melhorar minha compreensão e comunicação no idioma inglês.

### Detalhamento da história de usuário:

1. Tela de Boas-Vindas e Registro:

**Descrição**: Apresenta uma mensagem de boas-vindas e oferece a opção de registro ou login para o usuário.

**Funcionalidades**: Campos para cadastro de novo usuário ou login para acesso à plataforma.

2. Seleção de Nível de Dificuldade:

**Descrição**: Permite que o usuário escolha o nível de dificuldade do vocabulário a ser aprendido.

**Funcionalidades**: Opções para iniciantes, intermediários e avançados, adaptando o conteúdo conforme o nível selecionado.

3. Exibição de Palavras e Frases:

**Descrição**: Apresenta palavras em inglês com suas traduções ou frases simples no idioma alvo.

**Funcionalidades**: Exibe a palavra ou frase acompanhada de sua pronúncia, imagem ilustrativa (se aplicável) e opção para ouvir a pronúncia.

4. Testes de Compreensão:

**Descrição**: Oferece pequenos testes para verificar a compreensão do vocabulário aprendido.

**Funcionalidades**: Questões de múltipla escolha, preenchimento de lacunas ou associação de imagens com palavras/frases.

5. Progresso e Estatísticas:

**Descrição**: Mostra o progresso do usuário e estatísticas sobre seu desempenho.

**Funcionalidades**: Indicadores visuais que exibem o progresso na aprendizagem, número de palavras aprendidas, testes realizados e pontuações.
6. Perfil do Usuário:

**Descrição**: Permite ao usuário visualizar e editar seu perfil, incluindo suas preferências de aprendizado.



## Telas a serem feitas
- [x] [Tela 1 - Boas vindas](/prova_senai/lib/pages/onboard.page.dart)
- [ ] [Opção cadastro ou login](/prova_senai/lib/pages/onboard.page.dart)
	- [x] [Formulário cadastro](/prova_senai/lib/pages/singup.page.dart)
        - [ ] Lógica de cadastro (inserção de novo usuario no banco de dados)
	- [x] [Formulário de Login](/prova_senai/lib/pages/login.page.dart)
        - [ ] Lógica de login e verificação no banco de dados
- [x] Seleção Nível de dificuldade
- [x] Tela ensinando algo em inglês
- [ ] Teste de compreensão (Questões de múltiplas escolhas)
- [ ] Sidebar
    - [ ] [Tela de progressos](/prova_senai/lib/pages/progress.dart)
    - [ ] [Tela de perfil de acesso](/prova_senai/lib/pages/profile.dart)
        (Poder atualizar os dados do perfil)

### Possivel Fluxo do sistema

```mermaid
graph TD;

Welcome[Tela Bem vindo] --> id1{Login ou Criar conta};

id1 --> singup[Criar conta];
id1 --> login[Já tenho cadastro];

singup --> formSingup[Formulário de cadastro];
formSingup --> formLogin;
login --> formLogin[Formulário de login];
formLogin--> selectLevel{- Inicianante - Intermediario - Avançado};

selectLevel --> teachSometing[Ensinar algo];
teachSometing --> comprehension[Teste de compreensão];
```


## Referencia
- ![Alt text](/prova_senai/assets/image01.png)
- 


---



