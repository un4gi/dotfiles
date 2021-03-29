crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
} # via Nahamsec

dirsearch(){
python3 ~/tools/dirsearch/dirsearch.py -u $1 -e $2 -t 150 --ua="Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36" $3 $4 $5 $6 $7 $8
}

ezssrf(){
curl "https://$1" --request-target http://$1.$2 -v -k --path-as-is -H "X-Originating-IP: 127.0.0.1" -H "X-Forwarded-For: 127.0.0.1" -H "X-Remote-IP: 127.0.0.1" -H "X-Client-IP: 127.0.0.1" -H "X-Source-IP: 127.0.0.1" -H "X-True-Client-IP: 127.0.0.1"
} # via tip from naffy

hailmary(){
python3 ~/tools/dirsearch/dirsearch.py -u $1 -t 100 -e php,asp,aspx,jsp,py,txt,conf,config,bak,backup,swp,old,db,sql $2 $3
} # via tip from hakluke

profile(){
vi ~/.bash_profile
} # via Nahamsec

ssrftest(){
for i in $(cat $1); do curl "https://$i/" --request-target http://$i.$2 -v -k --path-as-is --max-time 2 -H "X-Originating-IP: 127.0.0.1" -H "X-Forwarded-For: 127.0.0.1" -H "X-Remote-IP: 127.0.0.1" -H "X-Client-IP: 127.0.0.1" -H "X-Source-IP: 127.0.0.1" -H "X-True-Client-IP: 127.0.0.1"; done
} # via tip from naffy

sublist3r(){
python ~/tools/Sublist3r/sublist3r.py -d $1 | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" | sed -s 's/<BR>/\n/g' | sort -u
}

subnet2list(){
nmap -sL -n $1/$2 | awk '/Nmap scan report/{print $NF}'
}
