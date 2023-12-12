# Prova Senai

## Telas a serem feitas
- [ ] [Tela 1 - Boas vindas](/prova_senai/lib/welcome.dart)
- [ ] [Opção cadastro ou login](/prova_senai/lib/welcome.dart)
	- [ ] [Formulário cadastro(/prova_senai/lib/singup.dart)]
	- [ ] [Formulário de Login](/prova_senai/lib/login.dart)
- [ ] Seleção Nível de dificuldade
- [ ] Tela ensinando algo em inglês
- [ ] Teste de compreensão (Questões de múltiplas escolhas)
- [ ] Sidebar
    - [ ] [Tela de progressos](/prova_senai/lib/progress.dart)
    - [ ] [Tela de perfil de acesso](/prova_senai/lib/profile.dart)
        (Poder atualizar os dados do perfil)


## Referencia
- ![Alt text](/prova_senai/assets/image01.png)
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