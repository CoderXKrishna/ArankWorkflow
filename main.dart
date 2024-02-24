import 'dart:io';

void main(List<String> args) async {
  // Install ArankCli
  Process.runSync(
    'curl',
    [
      '-L',
      '-o',
      'Arank',
      'https://github.com/BLUE-DEVIL1134/ArankCli/releases/download/1.0.6/Arank-linux',
    ],
    runInShell: true,
    workingDirectory: './',
  );

  // Give permissions to ArankCli
  Process.runSync(
    'chmod',
    [
      'u+x',
      'Arank',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start ArankCli
  var init = Process.runSync(
    './Arank',
    [
      'init',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  stdout.write(init.stdout);
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', '-U', 'pip',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', '--no-cache-dir', '-r', './CoderXKrishna/requirements.txt',
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Install Dependencies
  Process.runSync(
    'pip',
    [
      'install', 'av', '--no-binary', 'av'
    ],
    runInShell: true,
    workingDirectory: './',
  );
  
  // Start ArankCli
  Process.start(
    './Arank',
    [
      'heroku',
    ],
    runInShell: true,
    workingDirectory: './',
    mode: ProcessStartMode.inheritStdio,
  );
}
