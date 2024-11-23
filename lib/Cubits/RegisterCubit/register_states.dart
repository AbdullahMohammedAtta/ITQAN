abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates
{
  // final RegisterModel registerModel;
  // RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates
{
  // final String error;
  // RegisterErrorState(this.error);
}


class CreateSuccessState extends RegisterStates
{
  // final RegisterModel registerModel;
  // RegisterSuccessState(this.registerModel);
}

class CreateErrorState extends RegisterStates
{
  final String error;
  CreateErrorState(this.error);
}


class IconRegisterVisabilityChangeState extends RegisterStates{}
