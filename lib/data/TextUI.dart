import 'Client.dart';
import 'Host.dart';
import 'JQueue.dart';
import 'QJMApp.dart';
import 'dart:io';

/*Testing the functionality of key backend components
in the QJM app with the command line*/

void main()
{
  QJMApp app = new QJMApp();  
  Host ncb = new Host("NCB", "000000000", "ncb@jncb.com");
  app.createHost(ncb);
  JQueue ncbLoans = new JQueue("Loan applications", 7, 4, ncb);
  app.createQueue(ncbLoans, ncb);
  print("Welcome!");
  print("1 - Join a line");
  print("2 - Set up a line");
  String user = stdin.readLineSync();
  switch(user)
  {
    case "1":
      print("Enter your email address");
      String email = stdin.readLineSync();
      Client client = new Client(email);
      app.createClient(client);
      print("Client with email " + client.getEmail() + " created");
      print("Printing active queues");
      app.getQueues().forEach((x) => print(x.getName()));
      print("");
      print("Executing search for NCB to see details");
      print(app.search("0").getDetails());
      print("Joining NCB queue");
      app.joinQueue(ncbLoans, client);
      List<String> nameList = client.getQueues();
      print("Current Queues");
      for(String n in nameList)
      {
        JQueue q = app.search(n);
        print("\n" + q.getName() + "\nYou are in position " + app.getPosition(q,client).toString() +" of " + q.getQueueSize().toString());
      }
      print("Time to leave the line");
      app.leaveQueue(ncbLoans, client);
      print("IS NCB an empty queue?");
      List<Client> temp = app.search("0").getQueue();
      for(Client x in temp)
         print(x.getEmail());
      print("add client again");
      app.joinQueue(ncbLoans,client);
      temp = app.search("0").getQueue();
      for(Client x in temp)
         print(x.getEmail());
      break;

    case "2":
      app.joinQueue(ncbLoans, new Client("somn"));
      print("Name of organizing entity: ");
      String oName = stdin.readLineSync();
      print("Name of queue: ");
      String qName = stdin.readLineSync();
      print("Telephone number: ");
      String tn = stdin.readLineSync();
      print("Email address: ");
      String email = stdin.readLineSync();
      print("Maximum present at a time: ");
      int max = int.parse(stdin.readLineSync());
      Host host = new Host(oName, tn, email);
      app.createHost(host);
      JQueue queue = new JQueue(qName, max, max, host); //second max to sub for alertPosition
      app.createQueue(queue, host);
      Client fattaplow = new Client("fattaplow");
      app.createClient(fattaplow);
      app.joinQueue(queue, fattaplow);
      app.nextInLine(queue);
      app.getQueues().forEach((x) =>(print(x.getQueueCode() + "\nWaiting: " 
        + x.getQueueSize().toString() + "\nMissed: " + x.getBufferCount().toString() + "\nServed: " + x.getTotalServed().toString())));
      break;
  }   
}
