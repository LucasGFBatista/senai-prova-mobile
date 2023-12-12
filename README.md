# Prova Senai

## Telas a serem feitas
- [ ] [Tela 1 - Boas vindas](/lib/welcome.dart)
- [ ] [Opção cadastro ou login](/lib/welcome.dart)
	- [ ] [Formulário cadastro(/lib/singup.dart)]
	- [ ] [Formulário de Login](/lib/login.dart)
- [ ] Seleção Nível de dificuldade
- [ ] Tela ensinando algo em inglês
- [ ] Teste de compreensão (Questões de múltiplas escolhas)
- [ ] Sidebar
    - [ ] [Tela de progressos](/lib/progress.dart)
    - [ ] [Tela de perfil de acesso](/lib/profile.dart)
        (Poder atualizar os dados do perfil)


## Referencia
- ![Alt text](/assets/image01.png)
- 

```mermaid
flowchart TD

Welcome[Tela Bem vindo] --> id1{Login ou Criar conta}

id1 --> singup[Criar conta]
id1 --> login[Já tenho cadastro]

singup --> formSingup[Formulario de cadastro] --> formLogin
login --> formLogin[Formulario de login] --> selectLevel{- Inicianante
- Intermediario
- Avançado}

selectLevel --> teachSometing[Ensinar algo]
teachSometing --> comprehension[Teste de compreensão]
 ```