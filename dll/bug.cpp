__declspec(dllexport) void Bug() { (new char[99])[99] = 42; }