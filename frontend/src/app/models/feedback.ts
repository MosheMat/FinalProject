export class Feedback {

    public constructor(
        public id?: number,
        public userId?: number,
        public userName?:string,
        public createTime?: Date,
        public feedbackText?: string) {
    }

}