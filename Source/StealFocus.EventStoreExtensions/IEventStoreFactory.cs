namespace StealFocus.EventStoreExtensions
{
    using System;

    using EventStore;
    using EventStore.Dispatcher;

    [CLSCompliant(false)]
    public interface IEventStoreFactory
    {
        IStoreEvents Create(string connectionStringKey, IDispatchCommits dispatchCommits);
    }
}
