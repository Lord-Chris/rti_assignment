enum RoleTypeEnum {
  productDesigner('Product Designer'),
  flutterDeveloper('Flutter Developer'),
  qaTester('QA Tester'),
  productOwner('Product Owner');

  const RoleTypeEnum(this.name);
  final String name;

  static RoleTypeEnum fromName(String name) {
    switch (name) {
      case 'Product Designer':
        return RoleTypeEnum.productDesigner;
      case 'Flutter Developer':
        return RoleTypeEnum.flutterDeveloper;
      case 'QA Tester':
        return RoleTypeEnum.qaTester;
      case 'Product Owner':
        return RoleTypeEnum.productOwner;
      default:
        return RoleTypeEnum.productDesigner;
    }
  }
}
