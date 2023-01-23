// ignore_for_file: constant_identifier_names

import 'package:flutter_clean_architecture/app/extensions.dart';
import 'package:flutter_clean_architecture/data/responses/responses.dart';
import 'package:flutter_clean_architecture/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.numOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactsResponseMapper on ContactResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.email?.orEmpty() ?? EMPTY,
      this?.phone?.orEmpty() ?? EMPTY,
      this?.link?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.customer?.toDomain(),
      this?.contacts?.toDomain(),
    );
  }
}

extension ServiceResponseMapper on ServiceResponse? {
  Service toDomain() {
    return Service(
      this?.id?.orZero() ?? ZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
    );
  }
}

extension StoresResponseMapper on StoresResponse? {
  Store toDomain() {
    return Store(
      this?.id?.orZero() ?? ZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
    );
  }
}

extension BannerResponseMapper on BannerResponse? {
  BannerAd toDomain() {
    return BannerAd(
      this?.id?.orZero() ?? ZERO,
      this?.image?.orEmpty() ?? EMPTY,
      this?.title?.orEmpty() ?? EMPTY,
      this?.link?.orEmpty() ?? EMPTY,
    );
  }
}

extension HomeResponseMapper on HomeResponse? {
  HomeObject toDomain() {
    List<Service> mappedServices =
        (this?.data?.service.map((service) => service.toDomain()) ??
                const Iterable.empty())
            .cast<Service>()
            .toList();
    List<Store> mappedStores =
        (this?.data?.store.map((store) => store.toDomain()) ??
                const Iterable.empty())
            .cast<Store>()
            .toList();
    List<BannerAd> mappedBanners =
        (this?.data?.banner.map((banner) => banner.toDomain()) ??
                const Iterable.empty())
            .cast<BannerAd>()
            .toList();

    var data = HomeData(mappedServices, mappedStores, mappedBanners);

    return HomeObject(data);
  }
}
