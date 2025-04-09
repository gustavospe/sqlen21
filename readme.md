📘 Modelagem Física de Banco de Dados

Este repositório contém dois exercícios de modelagem física de banco de dados, com foco em sistemas reais. Cada exercício possui um contexto específico e segue boas práticas de modelagem, incluindo definição de chaves primárias e estrangeiras.
📁 Estrutura

.
├── modelagem_instrucoes.sql     # Script SQL do exercício 1 (Sistema de Hospedagem em Hotel)
├── modelagem_visual.mwb         # Arquivo do MySQL Workbench (EER) do exercício 2
└── README.md                    # Este arquivo

🏨 Exercício 1: Sistema de Reserva de Hospedagem em Hotel
📋 Contexto

Você deve modelar um banco de dados para um sistema de reservas de hospedagem em um hotel. O sistema permitirá que hóspedes façam reservas em diferentes tipos de quartos, com data de entrada e saída.
✅ Requisitos

    Hóspede: nome, CPF, telefone e e-mail.

    Quarto: número, tipo (simples, duplo, suíte), status (livre, ocupado, manutenção).

    Reserva: data de check-in e check-out, vinculada a um hóspede e a um quarto.

    Um hóspede pode ter várias reservas ao longo do tempo.

📌 Tarefas

    Criar a modelagem física com as tabelas e os relacionamentos.

    Definir chaves primárias e estrangeiras.

    Ignorar criação de índices.

📂 Script

O script está disponível no arquivo modelagem_instrucoes.sql.
🚌 Exercício 2: Sistema de Compra de Passagens de Ônibus
📋 Contexto

Você precisa modelar um sistema de vendas de passagens de ônibus, registrando informações sobre passageiros, horários de viagens e assentos ocupados.
✅ Requisitos

    Passageiro: nome, CPF e telefone.

    Viagem: operada por um ônibus, com origem, destino, data e horário.

    Ônibus: número único, total de assentos, empresa responsável.

    Passagem: associada a um passageiro, uma viagem e um assento.

    O sistema deve impedir a venda de um assento já reservado.

📌 Tarefas

    Criar a modelagem física com as tabelas e os relacionamentos.

    Definir chaves primárias e estrangeiras.

    Ignorar índices.

🧩 Observações

    A modelagem foi feita com interface visual no MySQL Workbench.

    A relação entre passageiro, passagem e viagem é essencial.

📂 Arquivo

A modelagem está no arquivo modelagem_visual.mwb.
🗓️ Prazo de Entrega

Data final: Quarta-feira, 09/04