#include <iostream>
#include <string>

using namespace std;

string encrypt (string input){
	//idk, it should do something
	return input;
}

int main(){
	cout << "Hi there, this is an encrypting program. Enter the sentence that you want encrypt";
	string sentence;

	cin>>sentence;

	string encrypted = encrypt(sentence);

	return 0;
}
