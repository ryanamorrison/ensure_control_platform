#!/bin/bash
# adapted from: http://docs.ansible.com/ansible/latest/reference_appendices/faq.html#how-do-i-access-shell-environment-variables

# defaults
VAR_PASSFILE="my_pass.txt"

#help function
show_help(){

cat<<-ENDOFMESSAGE

passwd_hash.bash 1.1

Creates a sha-512 crypted password suitable for /etc/shadow.

Usage: ./passwd_hash.bash [Options]

Options:
  --file                Path and file containing a single line with the password to be crypted.
  -f                    

  --help                Show this message.
  -h

ENDOFMESSAGE
}

# borrowed from
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -h|--help)
    show_help
    exit 0
    ;;
    -f|--file)
    VAR_PASSFILE="$2"
    shift # past argument
    shift # past value
    ;;
    *)    # unknown option
    show_help
    exit 0
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

# create hashed password
if [ -f $VAR_PASSFILE ]; then
  VAR_NEWPASS=$(head -n 1 $VAR_PASSFILE)
  python -c "from passlib.hash import sha512_crypt; print(sha512_crypt.using(rounds=5000).hash('"$VAR_NEWPASS"'))"
  rm $VAR_PASSFILE
fi
