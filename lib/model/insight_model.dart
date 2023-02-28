// To parse this JSON data, do
//
//     final insightsModel = insightsModelFromJson(jsonString);

import 'dart:convert';

List<InsightsModel> insightsModelFromJson(String str) =>
    List<InsightsModel>.from(
        json.decode(str).map((x) => InsightsModel.fromJson(x)));

String insightsModelToJson(List<InsightsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InsightsModel {
  InsightsModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.sticky,
    this.template,
    this.format,
    this.meta,
    this.categories,
    this.tags,
    this.links,
    this.embedded,
  });

  int? id;
  DateTime? date;
  DateTime? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  Status? status;
  InsightsModelType? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  CommentStatus? commentStatus;
  PingStatus? pingStatus;
  bool? sticky;
  String? template;
  Format? format;
  List<dynamic>? meta;
  List<int>? categories;
  List<dynamic>? tags;
  InsightsModelLinks? links;
  Embedded? embedded;
  bool isExpande = false;

  factory InsightsModel.fromJson(Map<String, dynamic> json) => InsightsModel(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        dateGmt:
            json["date_gmt"] == null ? null : DateTime.parse(json["date_gmt"]),
        guid: json["guid"] == null ? null : Guid.fromJson(json["guid"]),
        modified:
            json["modified"] == null ? null : DateTime.parse(json["modified"]),
        modifiedGmt: json["modified_gmt"] == null
            ? null
            : DateTime.parse(json["modified_gmt"]),
        slug: json["slug"],
        status: statusValues.map[json["status"]]!,
        type: insightsModelTypeValues.map[json["type"]]!,
        link: json["link"],
        title: json["title"] == null ? null : Guid.fromJson(json["title"]),
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        excerpt:
            json["excerpt"] == null ? null : Content.fromJson(json["excerpt"]),
        author: json["author"],
        featuredMedia: json["featured_media"],
        commentStatus: commentStatusValues.map[json["comment_status"]]!,
        pingStatus: pingStatusValues.map[json["ping_status"]]!,
        sticky: json["sticky"],
        template: json["template"],
        format: formatValues.map[json["format"]]!,
        meta: json["meta"] == null
            ? []
            : List<dynamic>.from(json["meta"]!.map((x) => x)),
        categories: json["categories"] == null
            ? []
            : List<int>.from(json["categories"]!.map((x) => x)),
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        links: json["_links"] == null
            ? null
            : InsightsModelLinks.fromJson(json["_links"]),
        embedded: json["_embedded"] == null
            ? null
            : Embedded.fromJson(json["_embedded"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "date_gmt": dateGmt?.toIso8601String(),
        "guid": guid?.toJson(),
        "modified": modified?.toIso8601String(),
        "modified_gmt": modifiedGmt?.toIso8601String(),
        "slug": slug,
        "status": statusValues.reverse[status],
        "type": insightsModelTypeValues.reverse[type],
        "link": link,
        "title": title?.toJson(),
        "content": content?.toJson(),
        "excerpt": excerpt?.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatusValues.reverse[commentStatus],
        "ping_status": pingStatusValues.reverse[pingStatus],
        "sticky": sticky,
        "template": template,
        "format": formatValues.reverse[format],
        "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x)),
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "_links": links?.toJson(),
        "_embedded": embedded?.toJson(),
      };
}

enum CommentStatus { OPEN }

final commentStatusValues = EnumValues({"open": CommentStatus.OPEN});

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"],
        protected: json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Embedded {
  Embedded({
    this.author,
    this.wpFeaturedmedia,
    this.wpTerm,
  });

  List<EmbeddedAuthor>? author;
  List<WpFeaturedmedia>? wpFeaturedmedia;
  List<List<EmbeddedWpTerm>>? wpTerm;

  factory Embedded.fromJson(Map<String, dynamic> json) => Embedded(
        author: json["author"] == null
            ? []
            : List<EmbeddedAuthor>.from(
                json["author"]!.map((x) => EmbeddedAuthor.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null
            ? []
            : List<WpFeaturedmedia>.from(json["wp:featuredmedia"]!
                .map((x) => WpFeaturedmedia.fromJson(x))),
        wpTerm: json["wp:term"] == null
            ? []
            : List<List<EmbeddedWpTerm>>.from(json["wp:term"]!.map((x) =>
                List<EmbeddedWpTerm>.from(
                    x.map((x) => EmbeddedWpTerm.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "wp:featuredmedia": wpFeaturedmedia == null
            ? []
            : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
        "wp:term": wpTerm == null
            ? []
            : List<dynamic>.from(wpTerm!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class EmbeddedAuthor {
  EmbeddedAuthor({
    this.id,
    this.name,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.links,
  });

  int? id;
  AuthorName? name;
  String? url;
  String? description;
  String? link;
  AuthorSlug? slug;
  Map<String, String>? avatarUrls;
  AuthorLinks? links;

  factory EmbeddedAuthor.fromJson(Map<String, dynamic> json) => EmbeddedAuthor(
        id: json["id"],
        name: authorNameValues.map[json["name"]]!,
        url: json["url"],
        description: json["description"],
        link: json["link"],
        slug: authorSlugValues.map[json["slug"]]!,
        avatarUrls: Map.from(json["avatar_urls"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        links: json["_links"] == null
            ? null
            : AuthorLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": authorNameValues.reverse[name],
        "url": url,
        "description": description,
        "link": link,
        "slug": authorSlugValues.reverse[slug],
        "avatar_urls": Map.from(avatarUrls!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "_links": links?.toJson(),
      };
}

class AuthorLinks {
  AuthorLinks({
    this.self,
    this.collection,
  });

  List<About>? self;
  List<About>? collection;

  factory AuthorLinks.fromJson(Map<String, dynamic> json) => AuthorLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

enum AuthorName { SYBRAND }

final authorNameValues = EnumValues({"Sybrand": AuthorName.SYBRAND});

enum AuthorSlug { SYBRAND }

final authorSlugValues = EnumValues({"sybrand": AuthorSlug.SYBRAND});

class WpFeaturedmedia {
  WpFeaturedmedia({
    this.id,
    this.date,
    this.slug,
    this.type,
    this.link,
    this.title,
    this.author,
    this.smush,
    this.caption,
    this.altText,
    this.mediaType,
    this.mimeType,
    this.mediaDetails,
    this.sourceUrl,
    this.links,
  });

  int? id;
  DateTime? date;
  String? slug;
  WpFeaturedmediaType? type;
  String? link;
  Guid? title;
  int? author;
  Smush? smush;
  Guid? caption;
  String? altText;
  MediaType? mediaType;
  MimeType? mimeType;
  MediaDetails? mediaDetails;
  String? sourceUrl;
  WpFeaturedmediaLinks? links;

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmedia(
        id: json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        slug: json["slug"],
        type: wpFeaturedmediaTypeValues.map[json["type"]]!,
        link: json["link"],
        title: json["title"] == null ? null : Guid.fromJson(json["title"]),
        author: json["author"],
        smush: json["smush"] == null ? null : Smush.fromJson(json["smush"]),
        caption:
            json["caption"] == null ? null : Guid.fromJson(json["caption"]),
        altText: json["alt_text"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        mimeType: mimeTypeValues.map[json["mime_type"]]!,
        mediaDetails: json["media_details"] == null
            ? null
            : MediaDetails.fromJson(json["media_details"]),
        sourceUrl: json["source_url"],
        links: json["_links"] == null
            ? null
            : WpFeaturedmediaLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date?.toIso8601String(),
        "slug": slug,
        "type": wpFeaturedmediaTypeValues.reverse[type],
        "link": link,
        "title": title?.toJson(),
        "author": author,
        "smush": smush?.toJson(),
        "caption": caption?.toJson(),
        "alt_text": altText,
        "media_type": mediaTypeValues.reverse[mediaType],
        "mime_type": mimeTypeValues.reverse[mimeType],
        "media_details": mediaDetails?.toJson(),
        "source_url": sourceUrl,
        "_links": links?.toJson(),
      };
}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"],
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class WpFeaturedmediaLinks {
  WpFeaturedmediaLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<ReplyElement>? author;
  List<ReplyElement>? replies;

  factory WpFeaturedmediaLinks.fromJson(Map<String, dynamic> json) =>
      WpFeaturedmediaLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? []
            : List<ReplyElement>.from(
                json["author"]!.map((x) => ReplyElement.fromJson(x))),
        replies: json["replies"] == null
            ? []
            : List<ReplyElement>.from(
                json["replies"]!.map((x) => ReplyElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
      };
}

class ReplyElement {
  ReplyElement({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory ReplyElement.fromJson(Map<String, dynamic> json) => ReplyElement(
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class MediaDetails {
  MediaDetails({
    this.width,
    this.height,
    this.file,
    this.filesize,
    this.sizes,
    this.imageMeta,
  });

  int? width;
  int? height;
  String? file;
  int? filesize;
  Map<String, MediaDetailsSize>?  sizes;
  ImageMeta? imageMeta;

  factory MediaDetails.fromJson(Map<String, dynamic> json) => MediaDetails(
        width: json["width"],
        height: json["height"],
        file: json["file"],
        filesize: json["filesize"],
        sizes: Map.from(json["sizes"]!).map((k, v) =>
            MapEntry<String, MediaDetailsSize>(
                k, MediaDetailsSize.fromJson(v))),
        imageMeta: json["image_meta"] == null
            ? null
            : ImageMeta.fromJson(json["image_meta"]),
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "file": file,
        "filesize": filesize,
        "sizes": Map.from(sizes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "image_meta": imageMeta?.toJson(),
      };
}

class ImageMeta {
  ImageMeta({
    this.aperture,
    this.credit,
    this.camera,
    this.caption,
    this.createdTimestamp,
    this.copyright,
    this.focalLength,
    this.iso,
    this.shutterSpeed,
    this.title,
    this.orientation,
    this.keywords,
  });

  String? aperture;
  String? credit;
  String? camera;
  String? caption;
  String? createdTimestamp;
  String? copyright;
  String? focalLength;
  String? iso;
  String? shutterSpeed;
  String? title;
  String? orientation;
  List<dynamic>? keywords;

  factory ImageMeta.fromJson(Map<String, dynamic> json) => ImageMeta(
        aperture: json["aperture"],
        credit: json["credit"],
        camera: json["camera"],
        caption: json["caption"],
        createdTimestamp: json["created_timestamp"],
        copyright: json["copyright"],
        focalLength: json["focal_length"],
        iso: json["iso"],
        shutterSpeed: json["shutter_speed"],
        title: json["title"],
        orientation: json["orientation"],
        keywords: json["keywords"] == null
            ? []
            : List<dynamic>.from(json["keywords"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "aperture": aperture,
        "credit": credit,
        "camera": camera,
        "caption": caption,
        "created_timestamp": createdTimestamp,
        "copyright": copyright,
        "focal_length": focalLength,
        "iso": iso,
        "shutter_speed": shutterSpeed,
        "title": title,
        "orientation": orientation,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
      };
}

class MediaDetailsSize {
  MediaDetailsSize({
    this.file,
    this.width,
    this.height,
    this.filesize,
    this.mimeType,
    this.sourceUrl,
  });

  String? file;
  int? width;
  int? height;
  int? filesize;
  MimeType? mimeType;
  String? sourceUrl;

  factory MediaDetailsSize.fromJson(Map<String, dynamic> json) =>
      MediaDetailsSize(
        file: json["file"],
        width: json["width"],
        height: json["height"],
        filesize: json["filesize"],
        mimeType: mimeTypeValues.map[json["mime_type"]]!,
        sourceUrl: json["source_url"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
        "width": width,
        "height": height,
        "filesize": filesize,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "source_url": sourceUrl,
      };
}

enum MimeType { IMAGE_JPEG }

final mimeTypeValues = EnumValues({"image/jpeg": MimeType.IMAGE_JPEG});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"image": MediaType.IMAGE});

class Smush {
  Smush({
    this.stats,
    this.sizes,
  });

  Stats? stats;
  Map<String, SmushSize>? sizes;

  factory Smush.fromJson(Map<String, dynamic> json) => Smush(
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        sizes: Map.from(json["sizes"]!).map(
            (k, v) => MapEntry<String, SmushSize>(k, SmushSize.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "stats": stats?.toJson(),
        "sizes": Map.from(sizes!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class SmushSize {
  SmushSize({
    this.percent,
    this.bytes,
    this.sizeBefore,
    this.sizeAfter,
    this.time,
  });

  double? percent;
  int? bytes;
  int? sizeBefore;
  int? sizeAfter;
  double? time;

  factory SmushSize.fromJson(Map<String, dynamic> json) => SmushSize(
        percent: json["percent"]?.toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
      };
}

class Stats {
  Stats({
    this.percent,
    this.bytes,
    this.sizeBefore,
    this.sizeAfter,
    this.time,
    this.apiVersion,
    this.lossy,
    this.keepExif,
  });

  double? percent;
  int? bytes;
  int? sizeBefore;
  int? sizeAfter;
  double? time;
  String? apiVersion;
  bool? lossy;
  int? keepExif;

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        percent: json["percent"]?.toDouble(),
        bytes: json["bytes"],
        sizeBefore: json["size_before"],
        sizeAfter: json["size_after"],
        time: json["time"]?.toDouble(),
        apiVersion: json["api_version"],
        lossy: json["lossy"],
        keepExif: json["keep_exif"],
      );

  Map<String, dynamic> toJson() => {
        "percent": percent,
        "bytes": bytes,
        "size_before": sizeBefore,
        "size_after": sizeAfter,
        "time": time,
        "api_version": apiVersion,
        "lossy": lossy,
        "keep_exif": keepExif,
      };
}

enum WpFeaturedmediaType { ATTACHMENT }

final wpFeaturedmediaTypeValues =
    EnumValues({"attachment": WpFeaturedmediaType.ATTACHMENT});

class EmbeddedWpTerm {
  EmbeddedWpTerm({
    this.id,
    this.link,
    this.name,
    this.slug,
    this.taxonomy,
    this.links,
  });

  int? id;
  String? link;
  WpTermName? name;
  WpTermSlug? slug;
  Taxonomy? taxonomy;
  WpTermLinks? links;

  factory EmbeddedWpTerm.fromJson(Map<String, dynamic> json) => EmbeddedWpTerm(
        id: json["id"],
        link: json["link"],
        name: wpTermNameValues.map[json["name"]]!,
        slug: wpTermSlugValues.map[json["slug"]]!,
        taxonomy: taxonomyValues.map[json["taxonomy"]]!,
        links: json["_links"] == null
            ? null
            : WpTermLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "name": wpTermNameValues.reverse[name],
        "slug": wpTermSlugValues.reverse[slug],
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "_links": links?.toJson(),
      };
}

class WpTermLinks {
  WpTermLinks({
    this.self,
    this.collection,
    this.about,
    this.wpPostType,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<About>? wpPostType;
  List<Cury>? curies;

  factory WpTermLinks.fromJson(Map<String, dynamic> json) => WpTermLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        wpPostType: json["wp:post_type"] == null
            ? []
            : List<About>.from(
                json["wp:post_type"]!.map((x) => About.fromJson(x))),
        curies: json["curies"] == null
            ? []
            : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "wp:post_type": wpPostType == null
            ? []
            : List<dynamic>.from(wpPostType!.map((x) => x.toJson())),
        "curies": curies == null
            ? []
            : List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  CuryName? name;
  Href? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: curyNameValues.map[json["name"]]!,
        href: hrefValues.map[json["href"]]!,
        templated: json["templated"],
      );

  Map<String, dynamic> toJson() => {
        "name": curyNameValues.reverse[name],
        "href": hrefValues.reverse[href],
        "templated": templated,
      };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues =
    EnumValues({"https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL});

enum CuryName { WP }

final curyNameValues = EnumValues({"wp": CuryName.WP});

enum WpTermName { UNCATEGORIZED, LAW, MONEY }

final wpTermNameValues = EnumValues({
  "Law": WpTermName.LAW,
  "Money": WpTermName.MONEY,
  "Uncategorized": WpTermName.UNCATEGORIZED
});

enum WpTermSlug { UNCATEGORIZED, LAW, MONEY }

final wpTermSlugValues = EnumValues({
  "law": WpTermSlug.LAW,
  "money": WpTermSlug.MONEY,
  "uncategorized": WpTermSlug.UNCATEGORIZED
});

enum Taxonomy { CATEGORY, POST_TAG }

final taxonomyValues =
    EnumValues({"category": Taxonomy.CATEGORY, "post_tag": Taxonomy.POST_TAG});

enum Format { STANDARD }

final formatValues = EnumValues({"standard": Format.STANDARD});

class InsightsModelLinks {
  InsightsModelLinks({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<ReplyElement>? author;
  List<ReplyElement>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<ReplyElement>? wpFeaturedmedia;
  List<About>? wpAttachment;
  List<LinksWpTerm>? wpTerm;
  List<Cury>? curies;

  factory InsightsModelLinks.fromJson(Map<String, dynamic> json) =>
      InsightsModelLinks(
        self: json["self"] == null
            ? []
            : List<About>.from(json["self"]!.map((x) => About.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<About>.from(
                json["collection"]!.map((x) => About.fromJson(x))),
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        author: json["author"] == null
            ? []
            : List<ReplyElement>.from(
                json["author"]!.map((x) => ReplyElement.fromJson(x))),
        replies: json["replies"] == null
            ? []
            : List<ReplyElement>.from(
                json["replies"]!.map((x) => ReplyElement.fromJson(x))),
        versionHistory: json["version-history"] == null
            ? []
            : List<VersionHistory>.from(json["version-history"]!
                .map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: json["predecessor-version"] == null
            ? []
            : List<PredecessorVersion>.from(json["predecessor-version"]!
                .map((x) => PredecessorVersion.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null
            ? []
            : List<ReplyElement>.from(
                json["wp:featuredmedia"]!.map((x) => ReplyElement.fromJson(x))),
        wpAttachment: json["wp:attachment"] == null
            ? []
            : List<About>.from(
                json["wp:attachment"]!.map((x) => About.fromJson(x))),
        wpTerm: json["wp:term"] == null
            ? []
            : List<LinksWpTerm>.from(
                json["wp:term"]!.map((x) => LinksWpTerm.fromJson(x))),
        curies: json["curies"] == null
            ? []
            : List<Cury>.from(json["curies"]!.map((x) => Cury.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? []
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? []
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": author == null
            ? []
            : List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": replies == null
            ? []
            : List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history": versionHistory == null
            ? []
            : List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "predecessor-version": predecessorVersion == null
            ? []
            : List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
        "wp:featuredmedia": wpFeaturedmedia == null
            ? []
            : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
        "wp:attachment": wpAttachment == null
            ? []
            : List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": wpTerm == null
            ? []
            : List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": curies == null
            ? []
            : List<dynamic>.from(curies!.map((x) => x.toJson())),
      };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) =>
      PredecessorVersion(
        id: json["id"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class LinksWpTerm {
  LinksWpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  Taxonomy? taxonomy;
  bool? embeddable;
  String? href;

  factory LinksWpTerm.fromJson(Map<String, dynamic> json) => LinksWpTerm(
        taxonomy: taxonomyValues.map[json["taxonomy"]]!,
        embeddable: json["embeddable"],
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomyValues.reverse[taxonomy],
        "embeddable": embeddable,
        "href": href,
      };
}

enum PingStatus { CLOSED }

final pingStatusValues = EnumValues({"closed": PingStatus.CLOSED});

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum InsightsModelType { POST }

final insightsModelTypeValues = EnumValues({"post": InsightsModelType.POST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
