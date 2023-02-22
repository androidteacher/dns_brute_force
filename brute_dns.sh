#!/bin/bash
printHelp() {
      echo "brute_dns.sh --ns <NS> --target <target_domain>"
}


ns=''
target=''
while [ "$1" != "" ]; do
  case $1 in
    --ns )
      shift
      ns=$1
      ;;
    --target )
      shift
      target=$1
      ;;
    * )
printHelp

      exit 1
  esac
  shift
done
if [ -z "$ns" ] || [ -z "$target"]; then
        printHelp
        exit 1
fi

python3 dnsrecon.py -n $ns -d $target -D subdomains-top1million-5000.txt -t brt


