<h1 align="center"> Nest-Cognito </h1>

## 📄 Descrição do projeto

Este repositório visa configurar duas instâncias EC2, cada uma em zonas de disponibilidade (AZs) distintas dentro da mesma região. Cada instância hospeda informações de repositórios diferentes, utilizando um Application Load Balancer para distribuir a carga entre elas. O Load Balancer direciona igualmente os usuários para uma das instâncias com base nas requisições recebidas.

## 🚩 Requisitos

- [Git](https://www.git-scm.com/downloads);
- [NodeJS](https://nodejs.org/en/);
- [Nest](https://docs.nestjs.com/);
- [Terraform](https://www.terraform.io/);
- Instalação [terraform Windows](https://nodejs.org/en/);
- Instalação(Recomendado) [terraform WSL Windows/Linux](https://nodejs.org/en/)
- Conta na [AWS](https://aws.amazon.com/pt/free/?gclid=CjwKCAjwyJqzBhBaEiwAWDRJVG7KfaYfc-gsL5jxvEllnRK8yfZHKsFUzKN2FdtJFTm9ciMAo4XQxhoCJrYQAvD_BwE&trk=eb5111a8-7144-44a0-b89b-294d1572e79e&sc_channel=ps&ef_id=CjwKCAjwyJqzBhBaEiwAWDRJVG7KfaYfc-gsL5jxvEllnRK8yfZHKsFUzKN2FdtJFTm9ciMAo4XQxhoCJrYQAvD_BwE:G:s&s_kwcid=AL!4422!3!507891927284!p!!g!!aws%20amazon%20com!12582854283!122410197809&all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all) (Recomendado plano gratuíto para não ter possíveis custos adicionais)

## 💻 Como iniciar

- Para iniciar execute os seguintes comandos
- Os comandos funcionarão corretamente somente dentro de uma máquina linux ou do wsl/linux

- Clone o repositorio para a sua máquina local.

```sh
git clone https://github.com/JeanCarlosDelai/LoudBalanceApp.git
```

- Acesse a pasta clonada

```sh
cd LoudBalanceApp
```

- Adicionar chaves da AWS no terminal para pode criar os recursos na AWS
- [Como gerar chaves AWS](https://www.git-scm.com/downloads)

```sh
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
```

- Iniciar o terraform

```sh
cd terraform
terraform init
```
- Rode o comando para criar o key-par para acessar as instâncias

```sh
ssh-keygen -t rsa -b 2048 -f ~/.ssh/LoudBalanceApp
```

- Rodar o comando para criar os serviços deste projeto

```sh
terraform apply -auto-approve
```

- Para acessar as instâncias atráves da conexão SSH
- Pegar o ip publico da instância desejada e colar após o @
- os ips públicos foram salvos em dois arquivos txt, um para cada instância

```sh
ssh -i ~/.ssh/LoudBalanceApp ec2-user@public-ip
```

- Para acessar o ip público do loud balancer no navegador
- Foi gerado um arquivo com o nome loud_balance_ip_public.txt
- Copie a informação presente no arquivo e cole no navegador
- Toda vez que a página for recarregada irá mostrar o hmtl de uma instâcia diferente
- Assim testando na prática o funcionamento lo LoudBalancer


## ❌ Remover recursos

- Para evitar possíves custos, efetue a destruição dos recursos com o comando abaixo

```sh
terraform destroy -auto-approve
```

## ✅ Tecnologias utilizadas

- Serviço de cloud: `AWS`
- Geração dos recursos da AWS (IAC): `terraform`
- Serviços da AWS utilizados: `EC2, APLB, VPC`

## 👨🏻‍💻 Desenvolvedor

[<img src="https://avatars.githubusercontent.com/u/112594276?v=4" width="80px;"/>](https://github.com/JeanCarlosDelai)