include <iostream>
// Importing file class
#include <fstream>
// Importing standard library file
#include<bits/stdc++.h>

using namespace std;

// Variables declared outside any function
// hence scope is global, hence global variables
string fname, lname, phone_num;

// Methods

// Helper Methods followed by
// Main driver method

void addContact();
void searchContact();
void help();
void self_exit();
bool check_digits(string);
bool check_numbers(string);

// Method 1
// Helper method
void self_exit()
{
	system("cls");
	cout << "nnnttThank You for using Contact-Saver!";
	exit(1);
}

// Method 2
// Helper method
void help()
{
	cout << "Help Center";
	cout << endl << endl;
	system("pause");
	system("cls");
}

// Method 3
// Helper method
void addContact()
{
	ofstream phone("number.txt", ios::app);
	system("cls");
	cout << "Enter First Name : ";
	cin >> fname;
	cout<<"\n";
	cout << "Enter Last Name : ";
	cin >> lname;
	cout<<"\n";
	cout << "Enter Phone Number : ";
	cin >> phone_num;
	cout<<"\n";

	if (check_digits(phone_num) == true) {
		if (check_numbers(phone_num) == true) {
			if (phone.is_open()) {
				phone << fname << " " << lname << " "
					<< phone_num << endl;
				cout << "Contact saved successfully !";
			}
			else {
				cout << "Error in opening record!";
			}
		}
		else {
			cout << "Only numbers are allowed!";
		}
	}
	else {
		cout << "Phone number should be of 10 digits "
				"only.";
	}
	cout << endl << endl;
	system("pause");
	system("cls");
	phone.close();
}

// Method 4
// Helper method
void searchContact()
{
	bool found = false;
	ifstream myfile("number.txt");
	string keyword;
	cout << "ntEnter Name to search : ";
	cin >> keyword;
	while (myfile >> fname >> lname >> phone_num) {
		if (keyword == fname || keyword == lname) {
			system("cls");
			cout << "CONTACT DETAILS";
			cout << "First Name : " << fname<<"\n";
			cout << "Last Name : " << lname<<"\n";
			cout << "nPhone Number : " << phone_num<<"\n";
			found = true;
			break;
		}
	}
	if (found == false)
		cout << "nNo such contact is found!";

	cout << endl << endl;
	system("pause");
	system("cls");
}

// Method 5
// Helper method
bool check_digits(string x)
{
	if (x.length() == 10)
		return true;
	else
		return false;
}

// Method 6
// Helper method
bool check_numbers(string x)
{
	bool check = true;

	for (int i = 0; i < x.length(); i++) {
		if (!(int(x[i]) >= 48 && int(x[i]) <= 57)) {
			check = false;
			break;
		}
	}

	if (check == true)
		return true;

	if (check == false)
		return false;

	cout << endl << endl;
	system("pause");
	system("cls");
}

// Method 7
// Main driver method
int main()
{
	int choice;
	system("cls");
	system("color 0A");
	while (1) {
		cout << "CONTACT SAVER";
		cout << "1. Add Contact    2.Search "
				"Contact3. Helpnt4. Exitnt> ";
		cin >> choice;

		// Switch case
		switch (choice) {
		case 1:
			addContact();
			break;

		case 2:
			searchContact();
			break;

		case 3:
			help();
			break;

		case 4:
			self_exit();
			break;

		default:
			cout << "Invalid Input!";
		}
	}
	return 0;
}
