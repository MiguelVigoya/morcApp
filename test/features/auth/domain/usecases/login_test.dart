import 'package:clean_morc/features/complex_housing/domain/entities/complex_housing.dart';
import 'package:clean_morc/features/auth/domain/entities/data_response_auth.dart';
import 'package:clean_morc/features/auth/domain/entities/auth_request.dart';
import 'package:clean_morc/features/auth/domain/entities/auth_response.dart';
import 'package:clean_morc/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:clean_morc/features/auth/domain/use_cases/login.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MokLoginRepository extends Mock implements AuthRepositoryInterface {}

/*void main() {
  final MokLoginRepository mokLoginRepository = MokLoginRepository(); ;
  final Login usecase = Login(mokLoginRepository);
  
  setUp(() {
    //mokLoginRepository = MokLoginRepository();
    //usecase = Login(mokLoginRepository);
  });

  const tLoginRequest = LoginRequest(email: 'test', password: 'test');
  const tLoginResponse = LoginResponse(
      data: DataResponseLogin(
        accessToken: 'accessToken1',
        personId: 1,
        userId: 1,
        username: 'username1',
        personEmail: 'personEmail1',
        name: 'name1',
        roles: ['HANDLE_COMPLEX_HOUSING'],
        lastName: 'lastName1',
        birth: 'birth1',
        numberId: 1,
        complexHousing: ComplexHousing(
            id: 20,
            name: 'Conjunto del migue',
            address: 'Las Gaviotas'),
      ),
      message: 'Resource successfully access',
      code: 200
  );
  
  test('result test login MorcApp',
          () async{
            when(mokLoginRepository.login(tLoginRequest))
                .thenAnswer((_) async => const Right(tLoginResponse));
            final result = await usecase(loginRequest: tLoginRequest);
            expect(result, const Right(tLoginResponse));
            //verify(mokLoginRepository.login(tLoginRequest));
            //verifyNoMoreInteractions(mokLoginRepository);
          });

}
*/