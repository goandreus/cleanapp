import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/connectivity/domain/errors/errors.dart';
import '../../../errors/errors.dart';
import '../../../../core/errors/messages.dart';
import '../../../../core/connectivity/domain/services/connectivity_service.dart';
import '../../../../core/connectivity/infra/drivers/connectivity_driver.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      var check = await driver.isOnline;
      if (check) {
        return Right(unit);
      }
      throw ErrorConnection(message: Messages.OFFLINE_CONNECTION);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ErrorConnection(
        message: Messages.FAILED_CONNECTION,
      ));
    }
  }
}
