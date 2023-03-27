import 'package:objectbox/objectbox.dart';

@Entity()
class Walkthrough {
  @Id()
  int obxId = 0;
  bool isFinished;

  Walkthrough(this.isFinished);
}
