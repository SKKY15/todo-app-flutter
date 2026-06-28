
class Challenge {


    final String id;
    String category;
    final DateTime date;
    double progress;


    Challenge({required this.id, required this.category, required this.date, required this.progress});


    String get formattedDate {
      final day = date.day.toString().padLeft(2,'0');
      final month = date.month.toString().padLeft(2,'0');
      final year = date.year;
      return "$day/$month/$year";
    }

    String get timeLeft {

      final datenow = DateTime.now();
      final difference = date.difference(datenow);

      if(difference.isNegative) {
          return "Expired";
      } else {
          final days = difference.inDays;
          if(days == 0) return "Today";
          if(days == 1) return "tommorow";
          if(days < 30) return "$days days left";
          final month = (days / 30).floor();
          if(month <= 12) return "$month months left";
          final year = (days / 365).floor();
          if(year == 1) return "$year year left";
          return "$year years left";
          
      }

    }
    static final List<Challenge> _allChallenges = [];

    static Challenge create({
       required String category,
       required DateTime date,
       required double progress,
    }) {
      final challenge =  Challenge(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        category: category,
        date: date,
        progress: progress,
      );
      _allChallenges.add(challenge);
      return challenge;
    }
    
    static List<Challenge> getAll() {
    return _allChallenges;
    }



}