# Products API

API RESTful para a aplicação de gestão de produtos.

## Funcionalidades

* **CRUD de Produtos:** Gerencia o ciclo de vida completo dos produtos (Criar, Ler, Atualizar, Deletar).
* **Listagem de Produtos:** Retorna a lista de todos os produtos.
* **Ordenação:** Produtos listados são ordenados pelo nome.
* **`missing_letter`:** Atributo calculado que indica a primeira letra do alfabeto (a-z) que está ausente no nome do produto. Retorna `_` se todas as letras estiverem presentes.
* **Validações:** Regras de negócio simples para garantir a integridade dos dados (nome não vazio, preço maior que zero, SKU único).

## Tecnologias

* Ruby 3.4.2
* Rails 8.0.2
* RSpec 3.13
* PostgreSQL

## Documentação de Endpoints 📚

| Endpoint        | Método | Descrição                                    |
| :-------------- | :----- | :------------------------------------------- |
| `/products`     | `GET`  | Retorna a lista ordenada de todos os produtos. |
| `/products`     | `POST` | Cria um novo produto.                        |
| `/products/:id` | `GET`  | Retorna os detalhes de um produto específico. |
| `/products/:id` | `PUT`  | Atualiza os dados de um produto existente.   |
| `/products/:id` | `DELETE`| Remove um produto.                           |

## Interagindo com os endpoints da API

### Listar Produtos

**GET** `http://localhost:3000/products`

**Response:**

```json
[
  {
    "id": 3,
    "name": "Fone de Ouvido Soundcode Q45",
    "price": "299.5",
    "sku": "FONEBT01",
    "missing_letter": "a"
  },
  {
    "id": 1,
    "name": "Notebook UltraPower X1",
    "price": "3999.99",
    "sku": "NTB001",
    "missing_letter": "c"
  },
  {
    "id": 2,
    "name": "Teclado Gamer RGB Pro",
    "price": "450.0",
    "sku": "TCLG001",
    "missing_letter": "f"
  }
]
```

### Criar um novo produto

**POST** `http://localhost:3000/cart`

**Request:**

```json
{
  "name": "Monitor Dell ",
  "price": 2499,
  "sku": "MONITOR001"
}
```

**Response:**

```json
{
  "id": 4,
  "name": "Monitor Dell ",
  "price": "2499.0",
  "sku": "MONITOR001",
  "missing_letter": "a"
}
```

### Exibir um produto específico

**GET** `http://localhost:3000/products/1`

**Response:**

```json
{
  "id": 1,
  "name": "Notebook UltraPower X1",
  "price": "3999.99",
  "sku": "NTB001",
  "missing_letter": "c"
}
```

### Atualizar um produto existente

**PUT** `http://localhost:3000/cart`

**Request:**

```json
{
  "name": "Notebook UltraPower C1",
  "price": 2399,
  "sku": "NTB002"
}
```

**Response:**

```json
{
  "id": 1,
  "name": "Notebook UltraPower C1",
  "price": "2399.0",
  "sku": "NTB002",
  "missing_letter": "d"
}
```

### Remover um produto específico

**DELETE** `http://localhost:3000/products/1`
