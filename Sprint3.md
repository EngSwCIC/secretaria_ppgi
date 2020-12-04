# Sprint 3

### Métodos refatorados 
    
#### Complexidade Ciclomática

Não houve métodos com complexidade alta suficiente na controladora de processos para que fosse necessária a refatoração.

#### Codesmells

Antes da refatoração: 24 code smells
Depois da refatoração: 19 code smells

- Movido pedaços repetidos de código pelos métodos para um método único (reset_status) 

- Criado uma before_action para redirecionar os usuários diretamente sem a necessidade de verificar se o usuário estava
em todos os métodos

#### SimpleCov

- Método de search com verificação nula desnecessária devido ao require de query_parameters