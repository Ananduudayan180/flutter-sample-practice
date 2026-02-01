import 'package:bloc_demo/pages/quote/bloc/quote_bloc.dart';
import 'package:bloc_demo/pages/quote/widgets/custom_button.dart';
import 'package:bloc_demo/pages/quote/widgets/error_message.dart';
import 'package:bloc_demo/pages/quote/widgets/quote_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuotePageWrapperProvider extends StatelessWidget {
  const QuotePageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => QuoteBloc(), child: QuotePage());
  }
}

class QuotePage extends StatelessWidget {
  const QuotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quotes')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<QuoteBloc, QuoteState>(
                  builder: (context, state) {
                    if (state is QuoteInitial) {
                      return const Text('Your quote is waiting');
                    } else if (state is QuoteLoadingState) {
                      return const CircularProgressIndicator(
                        color: Colors.green,
                      );
                    } else if (state is QuoteLoadedState) {
                      return QuoteWidget(quote: state.quote);
                    } else if (state is QuoteErrorState) {
                      return ErrorMessage(errorMsg: state.errorMsg);
                    }
                    return ErrorMessage(errorMsg: 'Error');
                  },
                ),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}
