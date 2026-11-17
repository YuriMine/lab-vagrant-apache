# Lab Vagrant Git

Laboratório de provisionamento de VM com **Vagrant**, **Rocky Linux 8** e **Apache**.

## Objetivo

Subir uma máquina virtual Linux com servidor web Apache acessível em `http://localhost:8080`, usando Vagrant para automação do provisionamento.

## Pré-requisitos

- [Vagrant](https://www.vagrantup.com/) ≥ 2.3
- Provider de virtualização: **VirtualBox** (padrão), VMware, Libvirt ou Hyper-V
- ~2 GB RAM livres
- ~10 GB disco livres

## Como usar

```bash
# 1. Clone o repositório
git clone https://github.com/YuriMine/lab-vagrant-git.git
cd lab-vagrant-git

# 2. Suba a VM
vagrant up

# 3. Acesse no navegador
# http://localhost:8080
```

> **Nota:** A porta 80 do guest é encaminhada para 8080 no host (127.0.0.1).

## Estrutura do Projeto

```
lab-vagrant-git/
├── README.md
├── LICENSE
├── .gitignore
├── Vagrantfile
├── provision.sh
└── html/                 # Arquivos servidos pelo Apache
    └── index.html
```

## Detalhes Técnicos

| Componente | Versão/Config |
|------------|---------------|
| Box base   | `generic/rocky8` |
| SO         | Rocky Linux 8 |
| Web Server | Apache (httpd) |
| Porta Guest | 80 |
| Porta Host  | 8080 (bind 127.0.0.1) |
| Firewall   | firewalld + serviço http |
| Sync Folder | `.` → `/vagrant` |
| RAM/CPU    | 1 GB / 1 vCPU |

## Provisionamento (`provision.sh`)

O script executa automaticamente no `vagrant up`:

1. Instala `httpd` e `firewalld` via `dnf`
2. Cria `/var/www/html`
3. Copia conteúdo de `html/` para o document root
3. Habilita e inicia `httpd` e `firewalld`
4. Libera porta 80 (HTTP) no firewall

## Troubleshooting

| Problema | Solução |
|----------|---------|
| Porta 8080 ocupada | Pare o processo ou mude `host: 8080` no `Vagrantfile` |
| `vagrant up` falha no provider | Instale o plugin: `vagrant plugin install vagrant-vmware-desktop` |
| Não acessa `localhost:8080` | Verifique `firewall-cmd --list-all` na VM; teste `curl 127.0.0.1` dentro da VM |
| Box não baixa | `vagrant box add generic/rocky8` manualmente |

## Limpeza

```bash
# Para e remove a VM
vagrant destroy -f

# Remove a box local (opcional)
vagrant box remove generic/rocky8
```

## Licença

MIT © YuriMine — veja [LICENSE](LICENSE).
