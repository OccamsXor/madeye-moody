# madeye-moody

This repo contains codes and scripts that can repeat some malware behaviour on a choosen target. Red and Blue Teams can benefit from understanding and repeating malware behaviours in controlled environments. The repo is named after the greatest Auror Alastor "Mad-Eye" Moody. 

| Malware Behaviour | Description | Reference |
| -- | -- | -- |
| **Rovnix UAC Bypass** | Rovnix Bootkit uses the "mocking trusted directory" technique for bypassing UAC. This technique is discussed in detail in [this post](https://medium.com/tenable-techblog/uac-bypass-by-mocking-trusted-directories-24a96675f6e). | [Rovnix Report](https://securelist.com/oh-what-a-boot-iful-mornin/97365/) |
| **Winapiexec Shellcode Injection** | Winapiexec is a tool that can execute Win32 API calls from commandline. Invisimole Threat Group is observed to be using Winapiexec for shellcode injection. | [Invisimole Report](https://www.welivesecurity.com/wp-content/uploads/2020/06/ESET_InvisiMole.pdf) |
| **Dridex PostMessage Macro** |  Recent Dridex samples (June 2020) seems to be using a new technique based on PostMessage for dropping files and executing WMIC commands. This is a simple poc VBA that can write a base64 encoded file and execute wmic commands using PostMessage. | [Dridex Post](https://reaqta.com/2020/06/dridex-the-secret-in-a-postmessage/) | 
