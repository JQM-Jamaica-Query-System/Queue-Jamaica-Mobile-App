import 'Client.dart';
import 'Host.dart';

class JQueue
{
  String name;
  static int count = 0; //generates a unique key for each JQueue
  String queueCode; //primary key from count
  List<Client> queue;
  List<Client> buffer;
  int queueSize, bufferCount, maxCapacity, totalServed, alertPosition;
  bool open;
  Host host;

  JQueue(String name, int maxCapacity, int alertPosition, Host host)
  {
    this.name = name;
    this.queueCode = (count++).toString(); //generates and assigns primary key
    this.maxCapacity = maxCapacity;
    this.buffer = new List();
    this.queue = new List();
    this.queueSize = 0; //how many people are in line
    this.bufferCount = 0; //how many people missed their chance to get served, excluding overflow
    this.totalServed = 0; //running total of how many got served since the queue was created
    this.alertPosition = alertPosition; //position where someone is called to physically join the line
    this.host = host;
    this.open = true;
  } 

  String getName()
  {
    return name;
  }
  void setName(String newName)
  {
    this.name = newName;
  }

  String getQueueCode()
  {
    return queueCode;
  }

  int getMaxCapacity()
  {
    return maxCapacity;
  }
  void setMaxCapacity(int newCapacity)
  {
    this.maxCapacity = newCapacity;
  }

  List<Client> getBuffer()
  {
    return buffer;
  }

  List<Client> getQueue()
  {
    return queue;
  }

  int getQueueSize()
  {
    return queueSize;
  }

  int getBufferCount()
  {
    return bufferCount;
  }

  int getTotalServed()
  {
    return totalServed;
  }

  int getAlertPosition()
  {
    return alertPosition;
  }

  void setAlertPosition(int newPos)
  {
    this.alertPosition = newPos;
  }

  void add(Client client)
  {
    if(open == true)
    {
      queue.add(client);
      queueSize++;
    }   
  }

  void leave(Client client)
  {
    for(int i=0; i<queueSize;i++) 
    {
      if(i.toString() == (client.getID()))
      {
        queue.removeAt(i);
        queueSize--;
        break;
      }
    }
  }

  Client pop()
  {
    Client client = queue.removeAt(0);
    queueSize--;
    totalServed++;
    return client;
  }

  void addToBuffer(Client client)
  {
    Client client = queue.removeAt(0);
    queueSize--;
    if(bufferCount == maxCapacity)
    {
      buffer.removeAt(0);
      bufferCount--;
    }    
      buffer.add(client);
      bufferCount++;  
  }

  void close()
  {
    open = false;
  }

  bool getStatus()
  {
    return open;
  }

  int getPosition(Client client)
  {    
    for(int i=0; i<queueSize; i++)
    {      
      if(queue[i].getID() == client.getID())
        return i+1;
    }
    return -1;
  }

  String getDetails()
  {
    String str = name;
    str += "\n" + host.getDetails();
    return str;
  }

}