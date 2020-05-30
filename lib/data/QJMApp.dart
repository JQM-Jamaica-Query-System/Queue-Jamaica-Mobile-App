import 'Client.dart';
import 'Host.dart';
import 'JQueue.dart';

class QJMApp
{
  List<JQueue> activeQueues;
  List<Host> hosts;
  List<Client> clients;

  QJMApp()
  {
    activeQueues = new List();
    hosts = new List();
    clients = new List();
  }

  void createHost(Host host)
  {
    hosts.add(host);
  }

  void createClient(Client client)
  {
    clients.add(client);
  }

  void createQueue(JQueue queue, Host host)
  {
    activeQueues.add(queue);
    for(Host h in hosts)
    {
      if(h.getID() == host.getID())
        h.addQueue(queue);
    }    
  }

  void joinQueue(JQueue queue, Client client)
  {
    if(queue.getStatus())
    {
      activeQueues.add(queue);
      for(Client c in clients)
      {
        if(c.getID() == client.getID())
          c.joinQueue(queue.getQueueCode());
          queue.add(client);
      }
    }
  }

  List<JQueue> getQueues()
  {
    return activeQueues;
  }

  void terminateQueue(JQueue queue)
  {
    String code = queue.getQueueCode();
    for(Client c in clients)
    {
      c.leaveQueue(code); //removes each client from the terminated line
    }
    for(Host h in hosts)
    {
      h.terminateQueue(queue);
    }
    activeQueues.remove(queue);
  }

  JQueue search(String code)
  {
    JQueue q = new JQueue(null, 0, 0, null);
    for(JQueue jq in activeQueues)
    {
      if(jq.getQueueCode() == code)
        q = jq;
    }
    return q;
  }

  void nextInLine(JQueue queue)
  {
    queue.pop();
  }

  void addToBuffer(JQueue queue, Client client)
  {
    queue.addToBuffer(client);
  }

  int getPosition(JQueue queue, Client client)
  {
    return queue.getPosition(client);
  }

  void leaveQueue(JQueue queue, Client client)
  {
    queue.leave(client);
  }
}