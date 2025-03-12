# HAMA - Home Asset Management App

HAMA é um aplicativo que permite aos usuários criar e gerenciar residências junto com seus principais ativos — sistemas e equipamentos essenciais que impactam a funcionalidade, eficiência e valor de uma casa.

👉 Acesse a versão web [AQUI](https://hama-35a8a.web.app/)

---

## 📱 Plataformas Suportadas

Desenvolvido com **Flutter**, o HAMA funciona nas seguintes plataformas:

- Android
- iOS
- Web
- MacOS

---

## 🚀 Como Executar o Projeto

**SDKs Utilizadas:**

- Flutter: `3.29.0`
- Dart: `3.7.0`

### Execução Manual

1. Clone o repositório:
   ```bash
   git clone <seu-repo>
   cd hama
   ```
2. Execute o aplicativo:
   ```bash
   flutter run
   ```
   Ou especifique a plataforma:
   ```bash
   flutter run -d <platform>
   ```

### Testes Automatizados
Execute todos os testes com o comando:
```bash
flutter test
```

---

## 🏗️ Arquitetura e Design

### Clean Architecture

O HAMA segue os princípios da **Clean Architecture**, com o código organizado em três camadas principais:

- **Data**
- **Domain**
- **Presentation**

Essa escolha prioriza **manutenibilidade**, **testabilidade** e **escalabilidade** da aplicação.

### MVVM + Cubit

Na camada de apresentação, foi adotado o padrão **MVVM** com **Cubit** para gerenciamento de estado. Essa abordagem minimiza o acoplamento entre a lógica de negócios e a interface de usuário.

### Estrutura de Pastas

- **`lib/src/core`**: Contém a lógica de negócio central, incluindo os **UseCases**, widgets reutilizáveis e tokens de design do sistema.
- **`lib/src/features`**: Abriga as páginas e funcionalidades específicas da aplicação.

---

## 🎨 System Design

Para garantir consistência visual, o projeto adota princípios de **Design System**, com:

- **Tokens de Cores e Tipografia** nomeados e reutilizáveis.
- **Componentes reutilizáveis**, promovendo padronização e economia de esforço no desenvolvimento de novas funcionalidades.

---

## ✅ Testes

Os testes são aplicados principalmente na camada de **Domain**, assegurando a consistência e confiabilidade da lógica de negócios da aplicação.

---

## ⚙️ CI/CD

Atualmente, o processo de **CI/CD** está implementado apenas para **Android**, utilizando o **Fastlane** para:

1. Análise de código.
2. Execução de testes com relatório de cobertura.
3. Build e empacotamento da versão de release.
4. Controle de versão baseado na contagem de commits do Git.

### Build Android com Fastlane
Navegue até a pasta `android` e execute:
```bash
fastlane release
```
