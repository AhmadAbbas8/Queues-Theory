import 'package:flutter/material.dart';
import 'package:queue/Helper.dart';
import 'package:queue/deterministic.dart';

class Result extends StatelessWidget {
  String? mu;
  String? lamba;
  String? k;
  int? m;

  Result({this.lamba, this.mu, this.k, this.m});

  @override
  Widget build(BuildContext context) {
    var trial = trialAndError(
        k: int.parse(k!), mu: int.parse(mu!), lamba: int.parse(lamba!));
    int lambaInt = int.parse(lamba!);
    int muInt = int.parse(mu!);
    int kInt = int.parse(k!);

    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: (muInt > lambaInt)
          ? SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Text(
                            'By Using trial and error the ti = ${trialAndError(k: int.parse(k!), mu: int.parse(mu!), lamba: int.parse(lamba!))}')),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(13),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('-> For t < 1/λ or t < $lambaInt '),
                              Center(child: Text('n(t) = 0'))
                            ],
                          ),
                          Divider(
                            color: Colors.grey[400],
                            height: 30,
                            thickness: 5,
                            endIndent: 30,
                            indent: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '-> For  1/λ <= t < ti or $lambaInt <= t < $trial '),
                              Center(child: Text('n(t) = [λt] - [µt - µ/λ]')),
                              Center(
                                  child: Text(
                                      'n(t) = [t/$lambaInt] - [t/$muInt - $muInt/$lambaInt]')),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[400],
                            height: 30,
                            thickness: 5,
                            endIndent: 30,
                            indent: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('-> For  t >= ti or t >= $trial '),
                              Center(
                                  child: Text(
                                      'n(t) alternates between ${kInt - 1} and ${kInt - 2} .')),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '''
            For n = 0
            Wq(n) = 0
            ----------------------------------------------------------------
            For n < λti where λti is the order number of the first
            balked customer,  or n < ${trialAndError(k: int.parse(k!), mu: int.parse(mu!), lamba: int.parse(lamba!)) / int.parse(lamba!)}
            ----------------------------------------------------------------
                          ''',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            '''
            Wq(n) = (1/µ   - 1/λ)(n-1)   
           

                          ''' //k=5 , lamba = 4 , mu = 6 ,
                            ,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          for (int i = 1;
                              i <
                                  (trialAndError(
                                              k: int.parse(k!),
                                              mu: int.parse(mu!),
                                              lamba: int.parse(lamba!)) /
                                          int.parse(lamba!))
                                      .toInt();
                              i++)
                            Text(
                              '           Wq(${i}) = ${(int.parse(mu!) - int.parse(lamba!)) * (i - 1)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          Text(
                            '''
            For n ≥ λti  or n ≥ ${trial / int.parse(lamba!)}, Wq(n) alternates 
            between (1/µ   - 1/λ)(λti -2) and (1/µ   - 1/λ)(λti -3) or
            Wq(n) = ${((int.parse(mu!) - int.parse(lamba!)) * (((1 / int.parse(lamba!)) * trial) - 2))}
            or
            Wq(n) = ${((int.parse(mu!) - int.parse(lamba!)) * (((1 / int.parse(lamba!)) * trial) - 3))}.

                        ''',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  CustomTextButton(
                      width: MediaQuery.of(context).size.width / 1.2,
                      onPress: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Deterministic(),
                            ),
                            (route) => false);
                      },
                      buttonName: 'Enter new values'),
                ],
              ),
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                      child: Text(
                          'By Using trial and error the ti = ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)}')),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(13),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '-> For t < ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)} '),
                            Center(
                                child: Text('n(t) = ${m!} + [t/$lamba] - [t]'))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[400],
                          height: 30,
                          thickness: 5,
                          endIndent: 30,
                          indent: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '-> For   t >= ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)}'),
                            Center(
                                child: Text(
                                    'n(t) = 0 where ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)} <= t < ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt) + 2} ')),
                            Center(
                                child: Text(
                                    'n(t) = 1 where ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt) + 2} <= t < ${trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt) + 3}')),
                          ],
                        ),
                        Divider(
                          color: Colors.grey[400],
                          height: 30,
                          thickness: 5,
                          endIndent: 30,
                          indent: 30,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.all(13),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('-> For n  = 0'),
                            Center(
                                child: Text(
                                    'Wq(0) = (M-1)/2µ = ${m! - 1} / ${2 * muInt} =${(m! - 1) / (2 * muInt)} '))
                          ],
                        ),
                        Divider(
                          color: Colors.grey[400],
                          height: 30,
                          thickness: 5,
                          endIndent: 30,
                          indent: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '-> for n <= [λti] or n <= ${((trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)) / lambaInt).round()}'),
                            Center(
                                child: Text(
                                    'Wq(n) = (M - 1 + n) (1/µ) - n (1/λ)')),
                          ],
                        ),
                        Divider(
                          color: Colors.grey[400],
                          height: 30,
                          thickness: 5,
                          endIndent: 30,
                          indent: 30,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                '-> for n > [λti] or n > ${((trialAndErrorSecondCase(m: m!, mu: muInt, lamba: lambaInt)) / lambaInt).round()}'),
                            Center(child: Text('Wq(n) = 0')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                CustomTextButton(
                    width: MediaQuery.of(context).size.width / 1.2,
                    onPress: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Deterministic(),
                          ),
                          (route) => false);
                    },
                    buttonName: 'Enter new values'),
              ],
            )),
    );
  }

  int trialAndError({required int k, required int mu, required int lamba}) {
    double t = (k - (lamba / mu)) * ((mu * lamba) / (mu - lamba));
    for (int i = 0; i < t.round(); i++) {
      int res = (i / lamba).toInt() - (i / mu - lamba / mu).toInt();
      if (res == k) return i;
    }
    return t.toInt();
  }

  int trialAndErrorSecondCase(
      {required int m, required int mu, required int lamba}) {
    double t = m * ((mu * lamba) / (lamba - mu));
    for (int i = 0; i < t.round(); i++) {
      int res = (i / lamba).toInt() - (i / mu - lamba / mu).toInt();
      if (res == k) return i;
    }
    return t.toInt();
  }

  List<String>? printWQN(int trial, int lamba) {
    List<String>? myList;
    for (int i = 1; i < trial / lamba; i++) {
      int res = 2 * (i - 1);

      myList!.add('Wq($i) = $res,');
    }
    return myList;
  }
}
