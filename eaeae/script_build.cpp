#include <bits/stdc++.h>
using namespace std;
int main()
{
    //auto-generate a script which will send 1 lakh inputs to the ssh server
    std::ofstream script;
    script.open("script_game.sh");
    script << "#!/usr/bin/expect\n";
    //log file stores output of the game screen
    script << "log_file -a game_outputs.log\n";
    script << "spawn ssh student@65.0.124.36\n";
    //string sshpwd, gpname, gppwd, infile;
    /*cout << "Enter your SSH Password : ";
    cin >> sshpwd;
    cout << "\nEnter your team name : ";
    cin >> gpname;
    cout << "\nEnter your team pwd : ";
    cin >> gppwd;*/
    script << "expect  \"student@65.0.124.36's password:\"\n";
    script << "send -- \"";
    script << "caesar";
    script << "\\r\"\n\n";
    script << "expect  \"group name:\"\n";
    script << "send -- \"";
    script << "Conundrum";
    script << "\\r\"\n\n";
    script << "expect  \"word:\"\n";
    script << "send -- \"";
    script << "qwerty";
    script << "\\r\"\n\n";
    script << "expect  \"at:\"\n";
    script << "send -- \"5\\r\"\n\n";
    script << "expect  \"> \"\n";
    script << "send -- \"go\\r\"\n\n";
    script << "expect  \"> \"\n";
    script << "send -- \"wave\\r\"\n\n";
    script << "expect  \"> \"\n";
    script << "send -- \"dive\\r\"\n\n";
    script << "expect  \"> \"\n";
    script << "send -- \"go\\r\"\n\n";
    script << "expect  \"> \"\n";
    script << "send -- \"read\\r\"\n\n";
    for (int i=1;i<=8;i++){

    std::ifstream input_random;
    input_random.open("inputs" + to_string(i) + ".txt");
    std::string line;
    if (input_random.is_open())
    {
        while (std::getline(input_random, line))
        {
            script << "expect  \"> \"\n";
            script << "send -- \"";
            script << line;
            script << "\\r\"\n\n";
            script << "expect  \"> \"\n";
            script << "send -- \"c\\r\"\n\n";
        }
        input_random.close();
    }
    }
    script.close();
}