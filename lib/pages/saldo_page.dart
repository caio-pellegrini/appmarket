import 'package:flutter/material.dart';

class SaldoPage extends StatelessWidget {
  const SaldoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Saldo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 16),

              _buildSaldoCard(context),

              const SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12.0)
                ),
                child: const Text('Adicionar Saldo')
              ),

              const SizedBox(height: 32),

              const Text(
                'Meus Cartões',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              _buildCartaoCard('Visa', '**** **** **** 4172', context),
              _buildCartaoCard('Mastercard', '**** **** **** 9054', context),
              const SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12.0)
                ),
                child: const Text('Adicionar Cartão')
              ),

            ],
          ),
        
        ),
      ),
    );
  }
}

Widget _buildSaldoCard(context) {
  return Card(
    elevation: 0,
    color: Theme.of(context).colorScheme.primaryContainer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
             
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Você possui',
            style: TextStyle(fontSize: 16, color: Colors.black54)
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.account_balance_wallet, size: 36, color: Colors.green[800]),
              SizedBox(width: 16),
              Text(
                'R\$ 25,99',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.green[800]),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'para usar em nossas lojas!',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ]
      ),
    ),
  );
}

Widget _buildCartaoCard(String bandeira, String numero, BuildContext context) {
  return Card(
    elevation: 0,
    color: Theme.of(context).colorScheme.primaryContainer,
    margin: const EdgeInsets.only(bottom: 12.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    child: ListTile(
      leading: const Icon(Icons.credit_card, color: Colors.black),
      title: Text(bandeira, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(numero),
    )
  );
}