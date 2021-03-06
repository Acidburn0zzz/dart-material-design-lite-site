import 'package:logging/logging.dart';
import 'package:console_log_handler/console_log_handler.dart';
import 'package:dryice/dryice.dart' as di;

import 'package:mdl/mdl.dart';
import 'package:mdl/mdlobservable.dart';

@di.injectable
class Application extends MaterialApplication {
    //final Logger _logger = new Logger('main.Application');

    final ObservableProperty<bool> checkAttribute = new ObservableProperty<bool>(false);

    Application() {
    }

    @override
    void run() {
    }

    //- private -----------------------------------------------------------------------------------

}

main() async {
    configLogging();

    registerMdl();

    final MaterialApplication application = await componentFactory().
        rootContext(Application).run(enableVisualDebugging: true);

    application.run();
}


void configLogging() {
    hierarchicalLoggingEnabled = false; // set this to true - its part of Logging SDK

    // now control the logging.
    // Turn off all logging first
    Logger.root.level = Level.INFO;
    Logger.root.onRecord.listen(new LogConsoleHandler());
}