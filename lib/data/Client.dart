import 'dart:core';

class Client {
  String email;
  List<String> queues;
  static int count = 0; //increments to give every client a unique ID
  String id; //unique ID
  
  Client(String email)
  {
    this.email = email;
    this.queues = new List(); //list of the ID of each queue
    id = (count++).toString();
  }
  void joinQueue(String queueID)
  {
      queues.add(queueID);
  }

  List<String> getQueues()
  {
    return queues;
  }

  void leaveQueue(String queue)
  {
    queues.remove(queue);
  }

  String getID()
  {
    return id;
  }
  
  String getEmail() {
    return this.email;
  }  
}

