# =================================================================================
#                                   Classes
# =================================================================================

class Cliente:
    def __init__(self, id_cliente, nome, endereco, cpf, cep):
        self.id_cliente = id_cliente
        self.nome = nome
        self.endereco = endereco
        self.cpf = cpf
        self.cep = cep

class Fornecedor:
    def __init__(self, id_fornecedor, nome, endereco, contato, cnpj):
        self.id_fornecedor = id_fornecedor
        self.nome = nome
        self.endereco = endereco
        self.contato = contato
        self.cnpj = cnpj

class Produto:
    def __init__(self, id_produto, nome, desc, lote, qntd, fornecedor):
        self.id_produto = id_produto
        self.nome = nome
        self.desc = desc
        self.lote = lote
        self.qntd = qntd # qntd = Estoque, qntd no estoque

        # Relacionamentos
        self.fornecedor = fornecedor

class Compra:
    def __init__(self, id_compra, data,  qtde, valor, produto, cliente):
        self.id_compra = id_compra
        self.data = data
        self.qtde = qtde
        self.valor = valor

        # Relacionamentos
        self.produto = produto
        self.cliente = cliente
    
    def show_info(self):
        print("== Informações da Compra ==")
        print(f"Produto: {self.produto.nome}")
        print(f"Valor: {self.valor}")
        print(f"Quantidade: {self.qtde}")
        print(f"Lote do Produto: {self.produto.lote}")
        print(f"Fornecedor do Produto: {self.produto.fornecedor.nome}")
        print(f"Contato do Fornecedor: {self.produto.fornecedor.contato}")
        print(f"Cliente: {self.cliente.nome}")

# =================================================================================
#                                Criação dos Objetos
# =================================================================================

cliente = Cliente(
    1, "Raimundo", "Rua tal tal tal", "00011122233", "77470000"
)

fornecedor = Fornecedor(
    1, "Samsumg", "Rua 777", "63000001111", "AA.AAA.AAA/AAAA-DV"
)

produto = Produto(
    1, "Micro-ondas", "Bom para anão surfar", "31022026", 5, fornecedor
)

compra = Compra(
    1, "12062026", 1, 300.00, produto, cliente
)

# =================================================================================
#                                   Teste
# =================================================================================

compra.show_info()