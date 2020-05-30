import 'JQueue.dart';

class Host {
  String nameOrganization;
  String telephoneNumber;
  String email;
  String services;
  static int count = 0;
  String id;
  List<JQueue> queues;

  Host(String name, String telephoneNo, String email) {
    this.nameOrganization = name;
    this.telephoneNumber = telephoneNo;
    this.email = email;
    this.id = (count++).toString();
    queues = new List();
  }

  String getID()
  {
    return id;
  }
  void setServices(String services)
  {
    this.services = services;
  }

  void setOrganizationName(String name)
  {
    this.nameOrganization = name;
  }

  void setTelephoneNumber(String n)
  {
    this.telephoneNumber = n;
  }

  void setEmail(String email)
  {
    this.email = email;
  }
  String getOrganizationName() {
    return this.nameOrganization;
  }

  String getTelephoneNumber() {
    return this.telephoneNumber;
  }

  String getEmail() {
    return this.email;
  }

  String getOrganizationType() {
    return this.services;
  }  

  void addQueue(JQueue queue)
  {
    queues.add(queue);
  }

  void terminateQueue(JQueue queue)
  {
    for(JQueue x in queues)
    {
      if(x.getQueueCode() == queue.getQueueCode())
      {
        queues.remove(x);
        break;
      }
    }
  }

  void closeQueue(JQueue queue)
  {
    for(JQueue x in queues)
    {
      if(x.getQueueCode() == queue.getQueueCode())
      {
        x.close();
        break;
      }
    }
  }

  List<JQueue> getQueues()
  {
    return queues;
  }

  String getDetails()
  {
    String str = nameOrganization;
    str += "\n" + telephoneNumber;
    str += "\n" + email;
    return str;
  }
}
