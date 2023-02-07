import 'package:either_dart/either.dart';
import 'package:simplibuy/notification/domain/entities/notification_data.dart';
import 'package:simplibuy/notification/domain/repositories/notifications_repo.dart';

import '../../../core/failure/failure.dart';
import '../../../core/result/result.dart';

class NotificationUsecase {
  final NotificationRepo _repo;

  NotificationUsecase(this._repo);

  getNotifications(
      Function(Either<Failure, Result<List<NotificationData>>> b) res) async {
    await _repo.getNotificationDate().then((value) => res.call(value));
  }
}
